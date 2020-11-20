//
//  NoteListCoordinatingController.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class NoteListCoordinator {

	// MARK: - Private Properties
	private let presenter: NavigationController
	private let modelController: ModelControllerProtocol
	private let notes: [Note]

	private var noteListViewController: NoteListViewController?
	private var noteDetailCoordinator: NoteDetailCoordinator?

	// MARK: - Initializers
	init(presenter: NavigationController, modelController: ModelControllerProtocol) {
		self.presenter = presenter
		self.modelController = modelController
		self.notes = modelController.getAllNotes()
	}

}

extension NoteListCoordinator: CoordinatorProtocol {
	func start() {
		let noteListViewController = NoteListViewController()
		noteListViewController.delegate = self
		noteListViewController.notes = self.notes

		presenter.pushViewController(noteListViewController, animated: true)

		self.noteListViewController = noteListViewController
	}

}

// MARK: - NoteListViewControllerDelegate
extension NoteListCoordinator: NoteListViewControllerDelegate {
	func listViewControllerDidSelectNote(_ selectedNote: Note) {
		let noteDetailCoordinator = NoteDetailCoordinator(presenter: self.presenter,
														  note: selectedNote,
														  modelController: self.modelController)
		noteDetailCoordinator.start()

		self.noteDetailCoordinator = noteDetailCoordinator
	}
}
