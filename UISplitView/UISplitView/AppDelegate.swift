//
//  AppDelegate.swift
//  UISplitView
//
//  Created by xdrond on 08.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	// MARK: - Public Properties
	var window: UIWindow?

	// MARK: - Public Methods
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		setupWindow()

		return true
	}

	// MARK: - Private Methods
	private func setupWindow(){

		let masterController = MasterViewController()
		let masterNavigationController = UINavigationController(rootViewController: masterController)

		let detailController = DetailViewController()
		let detailNavigationController = UINavigationController(rootViewController: detailController)

		let splitViewController =  UISplitViewController()
		splitViewController.viewControllers = [masterNavigationController, detailNavigationController]

		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window!.rootViewController = splitViewController
		self.window!.makeKeyAndVisible()
	}

}
