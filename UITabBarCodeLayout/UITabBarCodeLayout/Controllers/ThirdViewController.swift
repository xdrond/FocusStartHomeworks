//
//  ThirdViewController.swift
//  UITabBarCodeLayout
//
//  Created by xdrond on 01.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class ThirdViewController: UIViewController {

	// MARK: - Initializers
	init() {
		super.init(nibName: nil, bundle: nil)
		setupTabBarItemAppearances()
		setupNotificationAboutKeyboard()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle
	override func loadView() {
		self.view = ThirdView()
	}

}

// MARK: Setup TabBarItem Appearance
private extension ThirdViewController {
	func setupTabBarItemAppearances() {
		self.tabBarItem.image = UIImage.appImage(.loginIcon)
		self.tabBarItem.title = "Login"
	}
}

// MARK: - Keyboard notification.
private extension ThirdViewController {

	func setupNotificationAboutKeyboard() {
		NotificationCenter.default.addObserver(self,
											   selector: #selector(ThirdViewController.keyboardWillShow),
											   name: UIResponder.keyboardWillShowNotification,
											   object: nil)
		NotificationCenter.default.addObserver(self,
											   selector: #selector(ThirdViewController.keyboardWillHide),
											   name: UIResponder.keyboardWillHideNotification,
											   object: nil)
	}

	@objc func keyboardWillShow(notification: NSNotification) {
		guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
			return
		}
		if let thirdView = self.view as? ThirdView {
			thirdView.moveEnterButton(keyboardHeight: keyboardSize.height)

		}
	}

	@objc func keyboardWillHide(notification: NSNotification) {
		if let thirdView = self.view as? ThirdView {
			thirdView.moveEnterButton(keyboardHeight: 0)
		}
	}

}
