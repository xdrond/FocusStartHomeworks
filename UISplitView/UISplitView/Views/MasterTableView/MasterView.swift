//
//  MasterView.swift
//  UISplitView
//
//  Created by xdrond on 09.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class MasterView: UIView {

	// MARK: - Public Properties
	weak var tableViewDelegate: UITableViewDelegate? {
		didSet { self.tableView.delegate = self.tableViewDelegate }
	}
	weak var dataSource: UITableViewDataSource? {
		didSet { self.tableView.dataSource = self.dataSource }
	}

	// MARK: - Private Properties
	private let tableView = UITableView(frame: .zero, style: .plain)
	private let cellID = "MasterViewCell"

	// MARK: - Initializers
	init() {
		super.init(frame: .zero)

		self.setupViewsAppearance()
		self.setupViewsLayout()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

// MARK: - Appearances
private extension MasterView {

	func setupViewsAppearance() {
		self.setupViewAppearance()
		self.setupTableViewAppearance()
	}

	func setupViewAppearance() {
		self.backgroundColor = .white
	}

	func setupTableViewAppearance() {
		self.tableView.register(MasterViewCell.self, forCellReuseIdentifier: cellID)
		self.tableView.delegate = self.tableViewDelegate
		self.tableView.dataSource = self.dataSource
	}

}

// MARK: - Layout
private extension MasterView {

	func setupViewsLayout() {
		self.setupTableViewLayout()
	}

	func setupTableViewLayout() {
		self.tableView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(tableView)
		NSLayoutConstraint.activate([
			self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
			])
	}

}
