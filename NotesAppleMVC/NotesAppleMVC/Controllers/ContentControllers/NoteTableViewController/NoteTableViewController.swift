//
//  NoteTableViewController.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class NoteTableViewController: UIViewController {

	// MARK: - Public Properties
	weak var delegate: ITableViewControllerDelegate?

	var notes: [Note] = [] {
		didSet { self.dataSource.notes = self.notes }
	}

	// MARK: - Private Properties
	private lazy var tableView: ITableView = NoteTableView()
	private let dataSource = NoteDataSource()

	// MARK: - Lifecycle
	override func loadView() {
		self.navigationItem.title = "Notes"

		self.tableView.dataSource = dataSource
		self.tableView.tableViewDelegate = self

		guard let view = tableView as? UIView else {
			assertionFailure("Instance of ITableView is not a UIView.")
			return
		}
		self.view = view
	}

}

extension NoteTableViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let note = self.notes[indexPath.row]
		self.delegate?.tableViewControllerDidSelectNote(note)
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
