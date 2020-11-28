//
//  ModelController.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

// Provides note data from JSON
final class ModelController {

	// MARK: - Public Methods
	func attach(_ observer: IObserver) {
		self.observers.append(observer)
	}

	func detach(_ observer: IObserver) {
		if let index = observers.firstIndex(where: { $0 === observer }) {
			self.observers.remove(at: index)
		}
	}

	// MARK: - Private Properties
	private static let noteURL = Bundle.main.url(forResource: "notes", withExtension: "json")!
	private var notes: [Note] {
		didSet { self.notify() }
	}

	private lazy var observers: [IObserver] = []

	// MARK: - Private Methods
	func notify() {
		self.observers.forEach { $0.update() }
	}

	// MARK: - Initializers
	init() {
		// Parse json and store it's data
		guard let data = try? Data(contentsOf: ModelController.noteURL) else {
			assertionFailure("Failed file reading.")
			self.notes = []
			return
		}

		guard let notes = try? JSONDecoder().decode([Note].self, from: data) else {
			self.notes = []
			assertionFailure("Failed data parsing.")
			return
		}

		self.notes = notes
	}

}

extension ModelController: IModelController {
	func saveNote(note: Note) {
		if let index = self.notes.firstIndex(where: { $0.id == note.id }) {
			self.notes[index] = note
			
		}
	}

	func getAllNotes() -> [Note] {
		return self.notes
	}

	
}
