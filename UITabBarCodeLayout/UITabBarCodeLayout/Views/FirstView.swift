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
	private var rectangularButton = UIButton()

	private var image = UIImageView()
	private var spinner = UIActivityIndicatorView()

	private enum Constants: CGFloat {
		case borderIndent = 8
	}
	private var wChRConstraints: [NSLayoutConstraint] = []

	// MARK: - Initializers
	override init(frame: CGRect) {
		super.init(frame: frame)
		
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
		self.stackView.spacing = 4
	}

	func setupFirstLabelAppearance() {
		self.firstLabel.text = "Небольшой текст."
		self.firstLabel.textColor = UIColor.appColor(.fontColor)
		self.firstLabel.backgroundColor = UIColor.appColor(.backgroundColor)
	}

	func setupSecondLabelAppearance() {
		self.secondLabel.text = "Текст большого размера."
		self.secondLabel.font = .boldSystemFont(ofSize: 24)
		self.secondLabel.textColor = UIColor.appColor(.fontColor)
		self.secondLabel.backgroundColor = UIColor.appColor(.backgroundColor)
	}

	func setupThirdLabelAppearance() {
		self.thirdLabel.text = "Текст, всегда занимающий две строки."
		self.thirdLabel.numberOfLines = 2
		if let customFont = UIFont(name: "Helvetica", size: 17) {
			self.thirdLabel.font = customFont
		} else { assertionFailure("Font not found!") }
		self.thirdLabel.textColor = UIColor.appColor(.fontColor)
		self.thirdLabel.backgroundColor = UIColor.appColor(.backgroundColor)
	}

	func setupRoundButtonAppearance() {
		// Стоит добавить выполнение этого в viewDidLayoutSubviews,
		// чтобы гарантировать, что Auto Layout включен.
		self.roundButton.setTitle("🌎", for: .normal)
		self.roundButton.backgroundColor = UIColor.appColor(.fontColor)
		self.roundButton.layer.cornerRadius = self.roundButton.frame.width / 2
	}

	func setupRectangularButtonAppearance() {
		self.rectangularButton.setTitle("Кнопка", for: .normal)
		self.rectangularButton.backgroundColor = UIColor.appColor(.fontColor)
		self.rectangularButton.titleLabel?.textColor = UIColor.appColor(.backgroundColor)
		self.rectangularButton.layer.cornerRadius = 8
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
	func setupViewsLayout() {

		switch SizeClass.current {
		case .wChR:
			wChRSetupLayout()
		default:
			wChRSetupLayout()
			print("No constraints are configured for this SizeClass!")
		}

		disableTranslatesAutoresizingMaskIntoConstraints()
		NSLayoutConstraint.activate(wChRConstraints)
	}

	func wChRSetupLayout() {
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
		self.stackView.addArrangedSubview(self.rectangularButton)

		let set = [
			self.stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
												constant: -Constants.borderIndent.rawValue),
			self.stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.stackView.bottomAnchor.constraint(equalTo: self.image.topAnchor,
												   constant: -16)
		]
		wChRConstraints.append(contentsOf: set)

		self.addSubview(self.stackView)
	}

	func setupFirstLabelLayout() {}

	func setupSecondLabelLayout() {}

	func setupThirdLabelLayout() {}

	func setupRoundButtonLayout() {}

	func setupRectangularButtonLayout() {}

	func setupImageLayout() {
		self.addSubview(self.image)

		let set = [
			self.image.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			self.image.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
											   constant: -Constants.borderIndent.rawValue),
			self.image.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor,
											   multiplier: 0.3)
		]
		wChRConstraints.append(contentsOf: set)
	}

	func setupSpinnerLayout() {
		self.image.addSubview(self.spinner)

		let set = [
			self.spinner.centerXAnchor.constraint(equalTo: self.image.centerXAnchor),
			self.spinner.centerYAnchor.constraint(equalTo: self.image.centerYAnchor)
		]
		wChRConstraints.append(contentsOf: set)
	}
}
