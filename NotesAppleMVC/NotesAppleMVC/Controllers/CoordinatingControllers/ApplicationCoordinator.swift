//
//  ApplicationCoordinator.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class ApplicationCoordinator {
	
	// MARK: - Private Properties
	private let modelController: IModelController = ModelController()
	private let window: UIWindow
	private let rootViewController = NavigationController()
	private let noteTableCoordinator: NoteTableCoordinator
	
	// MARK: - Initializers
	init(window: UIWindow) {
		self.window = window
		self.noteTableCoordinator = NoteTableCoordinator(presenter: self.rootViewController,
														 modelController: self.modelController)
	}
	
}

extension ApplicationCoordinator: ICoordinator {
	func start() {
		self.window.rootViewController = rootViewController
		self.noteTableCoordinator.start()
		self.window.makeKeyAndVisible()
	}
	
}
