//
//  NoteDetailCoordinator.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

final class NoteDetailCoordinator {

	// MARK: - Private Properties
	private let presenter: NavigationController
	private var noteDetailViewController: NoteDetailViewController?
	private let modelController: IModelController
	private let note: Note

	// MARK: - Initializers
	init(presenter: NavigationController, note: Note, modelController: IModelController) {
		self.presenter = presenter
		self.note = note
		self.modelController = modelController
	}

}

extension NoteDetailCoordinator: ICoordinator {
	func start() {
		let noteDetailViewController = NoteDetailViewController(note: self.note,
																delegate: self)
		presenter.pushViewController(noteDetailViewController, animated: true)
		self.noteDetailViewController = noteDetailViewController
	}

}

extension NoteDetailCoordinator: ISaveNoteDelegate {
	func saveNote(note: Note) {
		self.modelController.saveNote(note: note)
	}
}
