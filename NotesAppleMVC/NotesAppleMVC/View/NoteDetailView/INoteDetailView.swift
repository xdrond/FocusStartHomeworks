//
//  INoteDetailView.swift
//  NotesAppleMVC
//
//  Created by xdrond on 24.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//
import UIKit

protocol INoteDetailView {
	
	var text: String { get set }
	var noteColor: UIColor? { get set }
}
