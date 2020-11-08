//
//  Third.swift
//  UITabBarCodeLayout
//
//  Created by xdrond on 30.10.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class ThirdView: UIView {

	// MARK: - Public Methods
	func moveEnterButton(keyboardHeight: CGFloat) {
		self.setupChangingButtonConstraints(keyboardHeight: keyboardHeight)
	}

	// MARK: - Private Properties
	private let loginTextField = UITextField()
	private let passwordTextField = UITextField()
	private let enterButton = UIButton()

	private var allConstraints: [NSLayoutConstraint] = []
	private var upButtonConstraints: [NSLayoutConstraint] = []
	private var bottomButtonConstraints: [NSLayoutConstraint] = []

	// MARK: - Initializers
	init() {
		super.init(frame: .zero)

		self.setupViewsAppearance()
		self.setupViewsLayout()
		self.setupGestures()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

// MARK: - Appearances
private extension ThirdView {

	func setupViewsAppearance() {
		self.setupViewAppearance()
		self.setupLoginTextFieldAppearance()
		self.setupPasswordTextFieldAppearance()
		self.setupEnterButtonAppearance()
	}

	func setupViewAppearance() {
		self.backgroundColor = UIColor.appColor(.backgroundColor)
	}

	func setupLoginTextFieldAppearance() {
		self.loginTextField.placeholder = "Login"
		self.loginTextField.tag = 0
		self.loginTextField.keyboardType = .asciiCapable
		self.loginTextField.clearButtonMode = .whileEditing
		self.loginTextField.returnKeyType = .next
		self.loginTextField.borderStyle = .roundedRect
		self.loginTextField.textColor = UIColor.appColor(.fontColor)
		self.loginTextField.autocorrectionType = .no
	}

	func setupPasswordTextFieldAppearance() {
		self.passwordTextField.placeholder = "Password"
		self.passwordTextField.tag = 1
		self.passwordTextField.keyboardType = .asciiCapable
		self.passwordTextField.clearButtonMode = .whileEditing
		self.passwordTextField.returnKeyType = .done
		self.passwordTextField.borderStyle = .roundedRect
		self.passwordTextField.textColor = UIColor.appColor(.fontColor)
		self.passwordTextField.autocorrectionType = .no
		self.passwordTextField.isSecureTextEntry = true
	}

	func setupEnterButtonAppearance() {
		self.enterButton.setTitle("Enter", for: .normal)
		self.enterButton.titleLabel?.textColor = UIColor.appColor(.backgroundColor)
		self.enterButton.backgroundColor = UIColor.appColor(.fontColor)
		self.enterButton.layer.cornerRadius = 28
		self.enterButton.titleLabel?.textAlignment = .center
	}

}

// MARK: - Layout
private extension ThirdView {

	func setupViewsLayout() {
		self.disableTranslatesAutoresizingMaskIntoConstraints()
		self.setupSubviews()
		self.setupConstraints()
	}

	func disableTranslatesAutoresizingMaskIntoConstraints() {
		self.loginTextField.translatesAutoresizingMaskIntoConstraints = false
		self.passwordTextField.translatesAutoresizingMaskIntoConstraints = false
		self.enterButton.translatesAutoresizingMaskIntoConstraints = false
	}

	func setupSubviews() {
		self.addSubview(self.loginTextField)
		self.addSubview(self.passwordTextField)
		self.addSubview(self.enterButton)
	}

}

// MARK: - Constraints
private extension ThirdView {

	func setupConstraints() {
		self.setupLoginTextFieldConstraints()
		self.setupPasswordTextFieldConstraints()
		self.setupButtonConstraints()
		NSLayoutConstraint.activate(allConstraints)
		self.setupChangingButtonConstraints(keyboardHeight: 0)
	}

	func setupLoginTextFieldConstraints() {
		let set = [
			self.loginTextField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,
													 constant: 64),
			self.loginTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,
														 constant: 24),
			self.loginTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,
														  constant: -24),
			self.loginTextField.heightAnchor.constraint(equalToConstant: 32)
		]
		self.allConstraints.append(contentsOf: set)
	}

	func setupPasswordTextFieldConstraints() {
		let set = [
			self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor,
														constant: 16),
			self.passwordTextField.centerXAnchor.constraint(equalTo: self.loginTextField.centerXAnchor),
			self.passwordTextField.heightAnchor.constraint(equalTo: self.loginTextField.heightAnchor),
			self.passwordTextField.widthAnchor.constraint(equalTo: self.loginTextField.widthAnchor)
		]
		self.allConstraints.append(contentsOf: set)
	}

	func setupButtonConstraints() {
		let set = [
				self.enterButton.heightAnchor.constraint(equalToConstant: 56),
				self.enterButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
				self.enterButton.widthAnchor.constraint(equalToConstant: 144),
		]
		self.allConstraints.append(contentsOf: set)
	}

	func setupChangingButtonConstraints(keyboardHeight: CGFloat) {

		if keyboardHeight.isZero {
			if let upActive = self.upButtonConstraints.first?.isActive {
				if upActive { NSLayoutConstraint.deactivate(self.upButtonConstraints) }
			}
			self.addBottomButtonConstraint()
			NSLayoutConstraint.activate(self.bottomButtonConstraints)
			UIView.animate(withDuration: 0.5) {
				self.layoutIfNeeded()
			}
		} else {
			if let bottomActive = self.bottomButtonConstraints.first?.isActive {
				if bottomActive { NSLayoutConstraint.deactivate(self.bottomButtonConstraints) }
			}
			self.addUpButtonConstraint(upTo: keyboardHeight)
			NSLayoutConstraint.activate(self.upButtonConstraints)
			UIView.animate(withDuration: 0.5) {
				self.layoutIfNeeded()
			}
		}
	}

	func addUpButtonConstraint(upTo: CGFloat) {
		if self.upButtonConstraints.isEmpty {
			self.upButtonConstraints.append(contentsOf: [
				self.enterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
														 constant: 32-upTo)
				])
		}
	}

	func addBottomButtonConstraint() {
		if self.bottomButtonConstraints.isEmpty {
			self.bottomButtonConstraints.append(contentsOf: [
				self.enterButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
														 constant: -32)
				])
		}
	}

}

// MARK: - Gestures
private extension ThirdView {

	func setupGestures() {
		self.hideKeyboardWhenTappedAround()
	}

	func hideKeyboardWhenTappedAround() {
		let tapGesture = UITapGestureRecognizer(target: self,
												action: #selector(self.hideKeyboard))
		self.addGestureRecognizer(tapGesture)
	}

	@objc func hideKeyboard() {
		self.endEditing(true)
	}
}
