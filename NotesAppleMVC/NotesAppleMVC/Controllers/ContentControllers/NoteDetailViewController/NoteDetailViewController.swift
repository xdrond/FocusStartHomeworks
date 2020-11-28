//
//  NoteDetailViewController.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class NoteDetailViewController: UIViewController {

	// MARK: - Private Properties
	private var note: Note
	private weak var delegate: ISaveNoteDelegate?
	private var detailView: INoteDetailView?

	// MARK: - Initializers
	init(note: Note, delegate: ISaveNoteDelegate) {
		self.note = note
		self.delegate = delegate
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle
	override func loadView() {
		let view = NoteDetailView(noteText: note.text,
								  color: note.backgroundUIColor,
								  delegate: self)
		self.view = view
		self.detailView = view
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationItem.title = note.text
		self.navigationItem.largeTitleDisplayMode = .never

    }

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		
		self.detailView?.noteUIColor = note.backgroundUIColor
		self.detailView?.text = note.text
	}

}

extension NoteDetailViewController: ISaveButtonPressedDelegate {
	func saveButtonPressed() {
		guard let text = self.detailView?.text else { return }
		self.note.text = text
		self.note.backgroundColor = self.detailView?.noteColor ?? "yellow"
		self.delegate?.saveNote(note: self.note)
	}

}
