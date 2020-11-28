//
//  IModelController.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

protocol IModelController {
	func attach(_ observer: IObserver)
	func detach(_ observer: IObserver)

	func getAllNotes() -> [Note]
	func saveNote(note: Note)
}
