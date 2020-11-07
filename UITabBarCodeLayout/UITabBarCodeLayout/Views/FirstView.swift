//
//  FirstView.swift
//  UITabBarCodeLayout
//
//  Created by xdrond on 30.10.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class FirstView: UIView {

	// MARK: - Private Properties
	private var stackView = UIStackView()
	private var firstLabel = UILabel()
	private var secondLabel = UILabel()
	private var thirdLabel = UILabel()

	private var roundButton = UIButton()
	private var rectButton = UIButton()

	private var image = UIImageView()
	private var spinner = UIActivityIndicatorView()

	private var compactRegularConstraints: [NSLayoutConstraint] = []

	// MARK: - Initializers
	init() {
		super.init(frame: .zero)
		
		setupViewsAppearance()
		setupViewsLayout()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

// MARK: - Private Methods
private extension FirstView {

	// MARK: - Appearances
	enum AppearanceConstants: CGFloat {
		case stackSpacing = 4

		case secondLabelFontSize = 24
		case thirdLabelFontSize = 17

		case rectButtonCornerRadius = 8
	}

	func setupViewsAppearance() {
		setupViewAppearance()

		setupStackViewAppearance()

		setupFirstLabelAppearance()
		setupSecondLabelAppearance()
		setupThirdLabelAppearance()

		setupRoundButtonAppearance()
		setupRectangularButtonAppearance()

		setupImageAppearance()
		setupSpinnerAppearance()
	}

	func setupViewAppearance() {
		self.backgroundColor = UIColor.appColor(.backgroundColor)
	}

	func setupStackViewAppearance() {
		self.stackView.axis = .vertical
		self.stackView.distribution = .equalCentering
		self.stackView.alignment = .center
		self.stackView.spacing = AppearanceConstants.stackSpacing.rawValue
	}

	func setupFirstLabelAppearance() {
		self.firstLabel.text = "Небольшой текст."
		self.firstLabel.textColor = UIColor.appColor(.fontColor)
		self.firstLabel.backgroundColor = UIColor.appColor(.backgroundColor)
	}

	func setupSecondLabelAppearance() {
		self.secondLabel.text = "Текст большого размера."
		self.secondLabel.font = .boldSystemFont(ofSize: AppearanceConstants.secondLabelFontSize.rawValue)
		self.secondLabel.textColor = UIColor.appColor(.fontColor)
		self.secondLabel.backgroundColor = UIColor.appColor(.backgroundColor)
	}

	func setupThirdLabelAppearance() {
		self.thirdLabel.text = "Текст, который всегда занимает две строки, но не больше."
		self.thirdLabel.textAlignment = .center
		self.thirdLabel.numberOfLines = 2

		if let customFont = UIFont(name: "Helvetica", size: AppearanceConstants.thirdLabelFontSize.rawValue) {
			self.thirdLabel.font = customFont
		} else { assertionFailure("Font not found!") }
		self.thirdLabel.textColor = UIColor.appColor(.fontColor)
		self.thirdLabel.backgroundColor = UIColor.appColor(.backgroundColor)
	}

	func setupRoundButtonAppearance() {
		self.roundButton.setTitle("🌎", for: .normal)
		self.roundButton.backgroundColor = UIColor.appColor(.fontColor)
		self.roundButton.layer.cornerRadius = LayoutConstants.roundButtonHeight.rawValue / 2
	}

	func setupRectangularButtonAppearance() {
		self.rectButton.backgroundColor = UIColor.appColor(.fontColor)
		self.rectButton.layer.cornerRadius = AppearanceConstants.rectButtonCornerRadius.rawValue
	}

	func setupImageAppearance() {
		self.image.image = UIImage.appImage(.waterSquare)
		self.image.contentMode = .scaleAspectFit
		self.image.clipsToBounds = true
	}

	func setupSpinnerAppearance() {
		self.spinner.style = .whiteLarge
		self.spinner.color = UIColor.appColor(.spinnerColor)
		self.spinner.startAnimating()
	}
}

// MARK: - Private Methods
private extension FirstView {

	// MARK: - Layout
	enum LayoutConstants: CGFloat {
		case thirdLabelWidth = 280

		case roundButtonHeight = 56
		case rectButtonWidth = 168

		case stackToImageSpacing = -16

		case imageHeightMultiplier = 0.3

		case borderIndent = 8
	}

	func setupViewsLayout() {

		switch SizeClass.current {
		case .compactRegular:
			CompactRegularSetupLayout()
		default:
			CompactRegularSetupLayout()
			print("No constraints are configured for this SizeClass!")
		}

		disableTranslatesAutoresizingMaskIntoConstraints()
		NSLayoutConstraint.activate(self.compactRegularConstraints)
	}

	func CompactRegularSetupLayout() {
		setupStackViewLayout()

		setupFirstLabelLayout()
		setupSecondLabelLayout()
		setupThirdLabelLayout()

		setupRoundButtonLayout()
		setupRectangularButtonLayout()

		setupImageLayout()
		setupSpinnerLayout()
	}

	func disableTranslatesAutoresizingMaskIntoConstraints() {
		for view in self.subviews {
			view.translatesAutoresizingMaskIntoConstraints = false
			view.subviews.forEach{ $0.translatesAutoresizingMaskIntoConstraints = false }
		}
	}

	func setupStackViewLayout() {
		self.stackView.addArrangedSubview(self.firstLabel)
		self.stackView.addArrangedSubview(self.secondLabel)
		self.stackView.addArrangedSubview(self.thirdLabel)
		self.stackView.addArrangedSubview(self.secondLabel)
		self.stackView.addArrangedSubview(self.thirdLabel)
		self.stackView.addArrangedSubview(self.roundButton)
		self.stackView.addArrangedSubview(self.rectButton)

		let set = [
			self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
												constant: LayoutConstants.borderIndent.rawValue),
			self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.stackView.bottomAnchor.constraint(equalTo: self.image.topAnchor,
												   constant: LayoutConstants.stackToImageSpacing.rawValue)
		]
		self.compactRegularConstraints.append(contentsOf: set)

		self.addSubview(self.stackView)
	}

	func setupFirstLabelLayout() {}

	func setupSecondLabelLayout() {}

	func setupThirdLabelLayout() {
		self.compactRegularConstraints.append(self.thirdLabel.widthAnchor.constraint(
			equalToConstant: LayoutConstants.thirdLabelWidth.rawValue))
	}

	func setupRoundButtonLayout() {
		let set = [
			self.roundButton.heightAnchor.constraint(equalToConstant: LayoutConstants.roundButtonHeight.rawValue),
			self.roundButton.widthAnchor.constraint(equalToConstant: LayoutConstants.roundButtonHeight.rawValue)
		]
		self.compactRegularConstraints.append(contentsOf: set)
	}

	func setupRectangularButtonLayout() {
		let set = [
			self.rectButton.heightAnchor.constraint(equalToConstant: LayoutConstants.roundButtonHeight.rawValue),
			self.rectButton.widthAnchor.constraint(equalToConstant: LayoutConstants.rectButtonWidth.rawValue)
		]
		self.compactRegularConstraints.append(contentsOf: set)
	}

	func setupImageLayout() {
		self.addSubview(self.image)

		let set = [
			self.image.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			self.image.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
											   constant: -LayoutConstants.borderIndent.rawValue),
			self.image.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor,
											   multiplier: LayoutConstants.imageHeightMultiplier.rawValue)
		]
		self.compactRegularConstraints.append(contentsOf: set)
	}

	func setupSpinnerLayout() {
		self.image.addSubview(self.spinner)

		let set = [
			self.spinner.centerXAnchor.constraint(equalTo: self.image.centerXAnchor),
			self.spinner.centerYAnchor.constraint(equalTo: self.image.centerYAnchor)
		]
		self.compactRegularConstraints.append(contentsOf: set)
	}
}
