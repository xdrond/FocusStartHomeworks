//
//  DetailView.swift
//  UISplitView
//
//  Created by xdrond on 09.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class DetailView: UIView {

	// MARK: - Public Properties
	var post: Post?

	// MARK: - Private Properties
	private let scrollView = UIScrollView()

	private let storyText = UILabel()
	private let firstContainerImage = ShadowImageView()
	private let secondContainerImage = ShadowImageView()

	private var constraintsCompactRegular: [NSLayoutConstraint] = []
	// MARK: - Initializers
	init() {
		super.init(frame: .zero)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle
	override func layoutSubviews() {
		super.layoutSubviews()
		self.setupContent(content: post)
		self.setupViewsAppearance()
		self.setupViewsLayout()
	}

}

// MARK: - Appearances
private extension DetailView {

	func setupContent(content: Post?) {
		self.storyText.text = content?.storyText
		self.firstContainerImage.imageView.image = content?.firstImage
		self.secondContainerImage.imageView.image = content?.secondImage
	}

	func setupViewsAppearance() {
		self.setupViewAppearance()
		self.setupStoryTextAppearance()
		self.setupFirstImageAppearance()
		self.setupSecondImageAppearance()
	}

	func setupViewAppearance() {
		self.backgroundColor = .white
	}

	func setupStoryTextAppearance() {

		self.storyText.numberOfLines = 0
	}

	func setupFirstImageAppearance() {
		self.firstContainerImage.imageView.contentMode = .scaleAspectFill
	}

	func setupSecondImageAppearance() {
		self.secondContainerImage.imageView.contentMode = .scaleAspectFill
	}

}

// MARK: - Layout
private extension DetailView {

	func setupViewsLayout() {
		self.setupScrollViewLayout()
		self.setupStoryTextLayout()
		self.setupFirstImageLayout()
		self.setupSecondImageLayout()
		NSLayoutConstraint.activate(self.constraintsCompactRegular)
	}

	func setupScrollViewLayout() {
		self.scrollView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(scrollView)
		let safeArea = self.safeAreaLayoutGuide
		self.constraintsCompactRegular.append(contentsOf: [
			self.scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
			self.scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
			self.scrollView.trailingAnchor.constraint(equalTo:safeArea.trailingAnchor),
			self.scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
			])
	}

	func setupStoryTextLayout() {
		self.storyText.translatesAutoresizingMaskIntoConstraints = false
		self.scrollView.addSubview(storyText)
		let safeArea = self.safeAreaLayoutGuide
		self.constraintsCompactRegular.append(contentsOf: [
			self.storyText.topAnchor.constraint(equalTo: self.scrollView.topAnchor,
												constant: 16),
			self.storyText.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
			self.storyText.widthAnchor.constraint(equalTo: safeArea.widthAnchor,
												  multiplier: 0.9),
//			self.storyText.heightAnchor.constraint(equalToConstant: self.storyText.he),
			self.storyText.bottomAnchor.constraint(equalTo: firstContainerImage.topAnchor,
												   constant: -16)

			])
	}

	func setupFirstImageLayout() {
		self.firstContainerImage.translatesAutoresizingMaskIntoConstraints = false
		self.scrollView.addSubview(firstContainerImage)
		let safeArea = self.safeAreaLayoutGuide
		self.constraintsCompactRegular.append(contentsOf: [
			self.firstContainerImage.topAnchor.constraint(equalTo: self.storyText.bottomAnchor,
														  constant: 16),
			self.firstContainerImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
			self.firstContainerImage.widthAnchor.constraint(equalTo: safeArea.widthAnchor,
												   multiplier: 0.9),
			self.firstContainerImage.heightAnchor.constraint(equalTo: self.firstContainerImage.widthAnchor, multiplier: 1)
			])
	}

	func setupSecondImageLayout() {
		self.secondContainerImage.translatesAutoresizingMaskIntoConstraints = false
		self.scrollView.addSubview(secondContainerImage)
		let safeArea = self.safeAreaLayoutGuide
		self.constraintsCompactRegular.append(contentsOf: [
			self.secondContainerImage.topAnchor.constraint(equalTo: self.firstContainerImage.bottomAnchor,
														   constant: 16),
			self.secondContainerImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
			self.secondContainerImage.widthAnchor.constraint(equalTo: safeArea.widthAnchor,
													multiplier: 0.9),
			self.secondContainerImage.heightAnchor.constraint(equalTo: self.secondContainerImage.widthAnchor, multiplier: 1),
			self.secondContainerImage.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor,
															  constant: -16)
			])
	}

}
