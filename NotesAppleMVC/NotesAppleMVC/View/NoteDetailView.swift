//
//  NoteDetailView.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class NoteDetailView: UIView {

	// MARK: - Initializers
	init() {
		super.init(frame: .zero)

		self.backgroundColor = .blue
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
