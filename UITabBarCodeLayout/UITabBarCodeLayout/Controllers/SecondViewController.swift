//
//  SecondViewController.swift
//  UITabBarCodeLayout
//
//  Created by xdrond on 01.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class SecondViewController: UIViewController {

	// MARK: - Initializers
	init() {
		super.init(nibName: nil, bundle: nil)
		setupTabBarItemAppearances()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle
	override func loadView() {
		self.view = SecondView()
	}

	// MARK: - Private Methods
	private func setupTabBarItemAppearances() {
		self.tabBarItem.image = UIImage.appImage(.landscapeIcon)
		self.tabBarItem.title = "Landscape"
	}
}
