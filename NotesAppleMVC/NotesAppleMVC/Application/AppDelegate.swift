//
//  AppDelegate.swift
//  NotesAppleMVC
//
//  Created by xdrond on 17.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	// MARK: - Public Properties
	var window: UIWindow?

	// MARK: - Private Properties
	private var applicationCoordinator: ApplicationCoordinator?

	// MARK: - Public Methods
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.applicationCoordinator = ApplicationCoordinator(window: self.window!)

		self.applicationCoordinator?.start()

		return true
	}

}

