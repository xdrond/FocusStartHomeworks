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
		didSet {
//			noteTableView?.reloadData()
		}
	}

	// MARK: - Lifecycle
	override func loadView() {
		self.view = NotesTableView()
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension NoteTableViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let note = self.notes[indexPath.row]
		self.delegate?.tableViewControllerDidSelectNote(note)
		//tableView.deselectRow(at: indexPath, animated: true)
	}
}
