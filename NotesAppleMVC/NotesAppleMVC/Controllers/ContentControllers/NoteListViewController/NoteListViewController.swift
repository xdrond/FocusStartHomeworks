//
//  NoteListViewController.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class NoteListViewController: UIViewController {

	// MARK: - Public Properties
	weak var delegate: NoteListViewControllerDelegate?
	var notes: [Note] = [] {
		didSet {
//			noteListTableView?.reloadData()
		}
	}

	// MARK: - Lifecycle
	override func loadView() {
		self.view = NotesListView()
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
