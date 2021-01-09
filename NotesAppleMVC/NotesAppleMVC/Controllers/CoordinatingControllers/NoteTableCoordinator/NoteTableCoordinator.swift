//
//  NoteTableCoordinator.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//


final class NoteTableCoordinator {

	// MARK: - Private Properties
	private let presenter: NavigationController
	private let modelController: IModelController

	private var noteTableViewController: NoteTableViewController?
	private var noteDetailCoordinator: NoteDetailCoordinator?

	// MARK: - Initializers
	init(presenter: NavigationController, modelController: IModelController) {
		self.presenter = presenter
		self.modelController = modelController
		self.modelController.attach(self)
	}

}

// MARK: - ICoordinator
extension NoteTableCoordinator: ICoordinator {
	func start() {
		let noteTableViewController = NoteTableViewController()

		noteTableViewController.delegate = self
		noteTableViewController.notes = self.modelController.getAllNotes()

		self.presenter.pushViewController(noteTableViewController, animated: true)
		self.noteTableViewController = noteTableViewController
	}

}

// MARK: - ITableViewControllerDelegate
extension NoteTableCoordinator: ITableViewControllerDelegate {
	func tableViewControllerDidSelectNote(_ selectedNote: Note) {
		let noteDetailCoordinator = NoteDetailCoordinator(presenter: self.presenter,
														  note: selectedNote,
														  modelController: self.modelController)
		noteDetailCoordinator.start()
		self.noteDetailCoordinator = noteDetailCoordinator
	}
}

// MARK: - IObserver
extension NoteTableCoordinator: IObserver {
	func update() {
		self.noteTableViewController?.notes = self.modelController.getAllNotes()
		self.noteTableViewController?.reloadData()
	}

}
