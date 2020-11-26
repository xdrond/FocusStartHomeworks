//
//  INote.swift
//  NotesAppleMVC
//
//  Created by xdrond on 24.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

protocol INote {
	var text: String { set get }
	var backgroundColor: String { set get }
}

extension INote {
	var backgroundUIColor: UIColor? {
		set { self.backgroundColor = newValue?.description ?? "yellow"}
		get { return UIColor(named: self.backgroundColor) }
	}
}
