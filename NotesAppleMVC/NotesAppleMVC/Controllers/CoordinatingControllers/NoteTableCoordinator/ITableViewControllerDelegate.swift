//
//  ITableViewControllerDelegate.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

protocol ITableViewControllerDelegate: AnyObject {
	func tableViewControllerDidSelectNote(_ selectedNote: Note)
}
