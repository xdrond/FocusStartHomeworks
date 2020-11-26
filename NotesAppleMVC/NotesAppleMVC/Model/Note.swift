//
//  Note.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//
import Foundation

struct Note: Codable, INote {
	let id = UUID()
	var text: String
	var backgroundColor: String
}
