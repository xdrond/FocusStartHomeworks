//
//  NoteListViewControllerDelegate.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

protocol NoteListViewControllerDelegate: class {
	func listViewControllerDidSelectNote(_ selectedNote: Note)
}
