//
//  ITableView.swift
//  NotesAppleMVC
//
//  Created by xdrond on 24.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//
import UIKit

protocol ITableView {
	var tableViewDelegate: UITableViewDelegate? { get set }
	var dataSource: UITableViewDataSource? { get set }

	func reloadData()
}
