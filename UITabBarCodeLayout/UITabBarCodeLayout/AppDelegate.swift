//
//  AppDelegate.swift
//  UITabBarCodeLayout
//
//  Created by xdrond on 30.10.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	// MARK: - Public Properties
	var window: UIWindow?

	// MARK: - Public Methods
	func application(_ application: UIApplication,
					 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		let tabBarController = createTabBarViewController(viewControllers: [FirstViewController(),
																			SecondViewController(),
																			ThirdViewController()])
		setupWindow(rootController: tabBarController)
		return true
	}

	// MARK: - Private Methods
	private func createTabBarViewController(viewControllers: [UIViewController]) -> UIViewController {
		let tabBarController = UITabBarController()
		tabBarController.setViewControllers(viewControllers, animated: true)
		return tabBarController
	}

	private func setupWindow(rootController: UIViewController) {
		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window?.rootViewController = rootController
		self.window?.makeKeyAndVisible()
	}

}

