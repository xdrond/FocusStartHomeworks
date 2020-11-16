//
//  FirstViewController.swift
//  UITabBarCodeLayout
//
//  Created by xdrond on 01.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class FirstViewController: UIViewController {

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
		self.view = FirstView()
	}

	// MARK: - Private Methods
	private func setupTabBarItemAppearances() {
		self.tabBarItem.image = UIImage.appImage(.buttonsIcon)
		self.tabBarItem.title = "Buttons"
	}
	
}
