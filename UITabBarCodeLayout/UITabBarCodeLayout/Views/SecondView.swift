//
//  SecondView.swift
//  UITabBarCodeLayout
//
//  Created by xdrond on 30.10.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class SecondView: UIView {

	// MARK: - Private Properties
	private var scrollView = UIScrollView()
	private var bannerImage = UIImageView()
	private var title = UILabel()
	private var textContent = UILabel()

	private var sharedConstraints: [NSLayoutConstraint] = []
	/**Portrait orientation.
	SizeClass - width Compact, height Regular.
	*/
	private var compactRegularConstraints: [NSLayoutConstraint] = []
	/**Landscape orientation.
	SizeClass - width Compact, height Compact.
	*/
	private var compactCompactConstraints: [NSLayoutConstraint] = []
	/**Landscape orientation.
	SizeClass - width Regular, height Compact
	*/
	private var regularCompactConstraints: [NSLayoutConstraint] = []

	// MARK: - Initializers
	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViewsAppearance()
		setupViewsLayout()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Change Lifecycle
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		setupConstraints()
	}
	
}

// MARK: - Appearances
private extension SecondView {

	enum AppearanceConstants: CGFloat {
		case secondLabelFontSize = 32
	}

	func setupViewsAppearance() {
		setupViewAppearance()

		setupScrollViewAppearance()

		setupImageAppearance()

		setupTitleAppearance()
		setupTextAppearance()
	}

	func setupViewAppearance() {
		self.backgroundColor = UIColor.appColor(.backgroundColor)
	}

	func setupScrollViewAppearance() {}

	func setupImageAppearance() {
		self.bannerImage.image = UIImage.appImage(.waterSquare)
		self.bannerImage.contentMode = .scaleAspectFill
		self.bannerImage.clipsToBounds = true
	}

	func setupTitleAppearance() {
		self.title.text = "Заголовок"
		self.title.numberOfLines = 1
		self.title.textAlignment = .center
		self.title.font = .boldSystemFont(ofSize: AppearanceConstants.secondLabelFontSize.rawValue)
		self.title.textColor = UIColor.appColor(.fontColor)
	}

	func setupTextAppearance() {
		self.textContent.numberOfLines = 0
		self.textContent.text =
		"""
		Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?
		"""
		self.textContent.textColor = UIColor.appColor(.fontColor)
		self.textContent.backgroundColor = UIColor.appColor(.backgroundColor)
	}

}

// MARK: - Layout
private extension SecondView {

	enum LayoutConstants: CGFloat {
		case imageHeightMultiplier = 0.5
		case borderIndent = 16
	}

	func setupViewsLayout() {
		disableTranslatesAutoresizingMaskIntoConstraints()
		setupSubviews()
		setupConstraints()
	}

	func disableTranslatesAutoresizingMaskIntoConstraints() {
		self.scrollView.translatesAutoresizingMaskIntoConstraints = false
		self.bannerImage.translatesAutoresizingMaskIntoConstraints = false
		self.title.translatesAutoresizingMaskIntoConstraints = false
		self.textContent.translatesAutoresizingMaskIntoConstraints = false
	}

	func setupSubviews() {
		self.addSubview(self.scrollView)
		self.scrollView.addSubview(self.bannerImage)
		self.scrollView.addSubview(self.title)
		self.scrollView.addSubview(self.textContent)
	}

	func setupConstraints() {

		setupSharedConstraints()

		switch SizeClass.current {
		case .compactRegular:
			setupCompactRegularConstraints()
		case .compactCompact:
			setupCompactCompactConstraints()
		case .regularCompact:
			// Layout well with Compact Compact.
			setupCompactCompactConstraints()
		case .regularRegular:
			// Layout well with Compact Regular.
			setupCompactRegularConstraints()
		case .unspecified:
			assertionFailure("No constraints are configured for this SizeClass!")
			setupCompactRegularConstraints()
		}
	}

	func deactivateIfActiveAllConstraints() {
		if let isActive = compactRegularConstraints.first?.isActive {
			if isActive { NSLayoutConstraint.deactivate(compactRegularConstraints) }
		}
		if let isActive = compactCompactConstraints.first?.isActive {
			if isActive { NSLayoutConstraint.deactivate(compactCompactConstraints) }
		}
		if let isActive = regularCompactConstraints.first?.isActive {
			if isActive { NSLayoutConstraint.deactivate(regularCompactConstraints) }
		}
	}

}

// MARK: - Shared constraints
private extension SecondView {

	func setupSharedConstraints() {
		if self.sharedConstraints.isEmpty {
			scrollViewConstraints()
		}
		if let isActive = self.sharedConstraints.first?.isActive {
			if !isActive { NSLayoutConstraint.activate(self.sharedConstraints) }
		}
	}

	func scrollViewConstraints() {
		self.sharedConstraints.append(contentsOf: [
			self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			self.scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
			])
	}
}

// MARK: - Compact Regular constraints
private extension SecondView {

	func setupCompactRegularConstraints() {
		if self.compactRegularConstraints.isEmpty {
			compactRegularBannerConstraints()
			compactRegularTitleConstraints()
			compactRegularTextConstraints()
		}
		if let isActive = self.compactRegularConstraints.first?.isActive {
			if !isActive {
				self.deactivateIfActiveAllConstraints()
				NSLayoutConstraint.activate(self.compactRegularConstraints)
			}
		}
	}

	func compactRegularBannerConstraints() {
		self.compactRegularConstraints.append(contentsOf: [
			self.bannerImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
			self.bannerImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.bannerImage.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.bannerImage.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor,
													 multiplier: LayoutConstants.imageHeightMultiplier.rawValue)
			])
	}

	func compactRegularTitleConstraints() {
		self.compactRegularConstraints.append(contentsOf: [
			self.title.topAnchor.constraint(equalTo: self.bannerImage.bottomAnchor, constant: 16),
			self.title.heightAnchor.constraint(equalToConstant: 40),
			self.title.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			])
	}

	func compactRegularTextConstraints() {
		self.compactRegularConstraints.append(contentsOf: [
			self.textContent.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 16),
			self.textContent.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.textContent.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.textContent.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
			])
	}

}

// MARK: - Compact Compact constraints
private extension SecondView {

	func setupCompactCompactConstraints() {
		if self.compactCompactConstraints.isEmpty {
			compactCompactBannerConstraints()
			compactCompactTitleConstraints()
			compactCompactTextConstraints()
		}
		if let isActive = self.compactCompactConstraints.first?.isActive {
			if !isActive {
				self.deactivateIfActiveAllConstraints()
				NSLayoutConstraint.activate(self.compactCompactConstraints)
			}
		}
	}

	func compactCompactBannerConstraints() {
		self.compactCompactConstraints.append(contentsOf: [
			self.bannerImage.topAnchor.constraint(equalTo: self.scrollView.topAnchor,
												  constant: LayoutConstants.borderIndent.rawValue),
			self.bannerImage.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
													  constant: LayoutConstants.borderIndent.rawValue),
			self.bannerImage.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor,
													 multiplier: LayoutConstants.imageHeightMultiplier.rawValue),
			self.bannerImage.widthAnchor.constraint(equalTo: self.bannerImage.heightAnchor)
			])
	}

	func compactCompactTitleConstraints() {
		self.compactCompactConstraints.append(contentsOf: [
			self.title.centerYAnchor.constraint(equalTo: self.bannerImage.centerYAnchor),
			self.title.heightAnchor.constraint(equalToConstant: 40),
			self.title.leadingAnchor.constraint(equalTo: self.bannerImage.trailingAnchor),
			self.title.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			])
	}

	func compactCompactTextConstraints() {
		self.compactCompactConstraints.append(contentsOf: [
			self.textContent.topAnchor.constraint(equalTo: self.bannerImage.bottomAnchor,
												  constant: 16),
			self.textContent.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
													  constant: LayoutConstants.borderIndent.rawValue),
			self.textContent.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.textContent.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
			])
	}

}
