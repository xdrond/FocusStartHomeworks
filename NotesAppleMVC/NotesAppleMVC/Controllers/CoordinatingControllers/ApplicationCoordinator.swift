//
//  ApplicationCoordinator.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class ApplicationCoordinator {

	let modelController: ModelControllerProtocol = ModelController()
	let window: UIWindow
	let rootViewController = NavigationController()
	let noteListCoordinator: NoteListCoordinator

	init(window: UIWindow) {
		self.window = window

		self.noteListCoordinator = NoteListCoordinator(presenter: self.rootViewController,
												   modelController: self.modelController)
	}

}

extension ApplicationCoordinator: CoordinatorProtocol {
	func start() {
		self.window.rootViewController = rootViewController

		noteListCoordinator.start()

		window.makeKeyAndVisible()
	}

}
