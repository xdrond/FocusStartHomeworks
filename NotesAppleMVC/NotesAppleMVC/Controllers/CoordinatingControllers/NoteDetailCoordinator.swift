//
//  NoteDetailCoordinator.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

class NoteDetailCoordinator {
	
	private let presenter: NavigationController
	private var noteDetailViewController: NoteDetailViewController?
	private let modelController: ModelControllerProtocol
	private let note: Note

	init(presenter: NavigationController, note: Note, modelController: ModelControllerProtocol) {

		self.note = note
		self.presenter = presenter
		self.modelController = modelController
	}

}

extension NoteDetailCoordinator: CoordinatorProtocol {
	func start() {
		let noteDetailViewController = NoteDetailViewController()
		noteDetailViewController.note = self.note

		presenter.pushViewController(noteDetailViewController, animated: true)
		self.noteDetailViewController = noteDetailViewController
	}

}
