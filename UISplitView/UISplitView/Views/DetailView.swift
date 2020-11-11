//
//  DetailView.swift
//  UISplitView
//
//  Created by xdrond on 09.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class DetailView: UIView {

	// MARK: - Private Properties
	private let scrollView = UIScrollView()

	private let storyText = UILabel()
	private let firstImage = UIImageView()
	private let secondImage = UIImageView()

	private var constraintsCompactRegular: [NSLayoutConstraint] = []
	// MARK: - Initializers
	init(post: Post?) {
		super.init(frame: .zero)

		self.setupContent(content: post)
		self.setupViewsAppearance()
		self.setupViewsLayout()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

// MARK: - Appearances
private extension DetailView {

	func setupContent(content: Post?) {
		self.storyText.text = content?.storyText
		self.firstImage.image = content?.firstImage
		self.secondImage.image = content?.secondImage
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
		self.firstImage.contentMode = .scaleAspectFit
		self.firstImage.clipsToBounds = true
	}

	func setupSecondImageAppearance() {
		self.secondImage.contentMode = .scaleAspectFit
		self.secondImage.clipsToBounds = true
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
			self.storyText.bottomAnchor.constraint(equalTo: firstImage.topAnchor)

			])
	}

	func setupFirstImageLayout() {
		self.firstImage.translatesAutoresizingMaskIntoConstraints = false
		self.scrollView.addSubview(firstImage)
		let safeArea = self.safeAreaLayoutGuide
		self.constraintsCompactRegular.append(contentsOf: [
			self.firstImage.topAnchor.constraint(equalTo: self.storyText.bottomAnchor),
			self.firstImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
			self.firstImage.widthAnchor.constraint(equalTo: safeArea.widthAnchor,
												   multiplier: 0.9),
			self.firstImage.heightAnchor.constraint(equalTo: self.firstImage.widthAnchor, multiplier: 1)
			])
	}

	func setupSecondImageLayout() {
		self.secondImage.translatesAutoresizingMaskIntoConstraints = false
		self.scrollView.addSubview(secondImage)
		let safeArea = self.safeAreaLayoutGuide
		self.constraintsCompactRegular.append(contentsOf: [
			self.secondImage.topAnchor.constraint(equalTo: self.firstImage.bottomAnchor),
			self.secondImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
			self.secondImage.widthAnchor.constraint(equalTo: safeArea.widthAnchor,
													multiplier: 0.9),
			self.secondImage.heightAnchor.constraint(equalTo: self.secondImage.widthAnchor, multiplier: 1),
			self.secondImage.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
			])
	}

}
