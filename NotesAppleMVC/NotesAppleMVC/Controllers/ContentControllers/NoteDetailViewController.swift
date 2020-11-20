//
//  NoteDetailViewController.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class NoteDetailViewController: UIViewController {

	// MARK: - Public Properties
	var note: Note?

	// MARK: - Lifecycle
	override func loadView() {
		self.view = NoteDetailView()
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
