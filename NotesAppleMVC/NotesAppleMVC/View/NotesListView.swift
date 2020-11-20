//
//  NotesListView.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class NotesListView: UIView {

	// MARK: - Initializers
	init() {
		super.init(frame: .zero)

		self.backgroundColor = .yellow
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
