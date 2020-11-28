//
//  NoteDataSource.swift
//  NotesAppleMVC
//
//  Created by xdrond on 24.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

// Я не уверен, где логически правильнее расположить datasource, поэтому положил его рядом
// с ViewController таблицы.

final class NoteDataSource: NSObject, UITableViewDataSource {

	// MARK: - Public Properties
	var notes: [Note] = []

	// MARK: - Private Properties
	private let errorText = "Expected \(NoteViewCell.self) type for reuseIdentifier \(NoteViewCell.reuseIdentifier)."

	// MARK: - Public Methods
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.notes.count
	}


	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteViewCell.reuseIdentifier,
													   for: indexPath) as? NoteViewCell else {
														assertionFailure(errorText)
														return NoteViewCell()
		}

		let note = self.notes[indexPath.row]
		
		cell.textLabel?.text = note.text
		cell.backgroundColor = note.backgroundUIColor

		return cell
	}

}
