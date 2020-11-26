//
//  IModelController.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

protocol IModelController {
	func getAllNotes() -> [Note]
	func saveNote(note: Note)
}
