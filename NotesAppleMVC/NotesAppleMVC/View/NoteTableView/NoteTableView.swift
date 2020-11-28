//
//  NoteTableView.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class NoteTableView: UIView {

	// MARK: - Public Properties
	weak var tableViewDelegate: UITableViewDelegate? {
		didSet { self.tableView.delegate = self.tableViewDelegate }
	}
	weak var dataSource: UITableViewDataSource? {
		didSet { self.tableView.dataSource = self.dataSource }
	}

	// MARK: - Private Properties
	private lazy var tableView: UITableView = self.setupTableAppearance()

	// MARK: - Initializers
//	init() {
//		super.init(frame: .zero)
//	}
//
//	required init?(coder aDecoder: NSCoder) {
//		fatalError("init(coder:) has not been implemented")
//	}

	// MARK: - Lifecycle
	override func layoutSubviews() {
		super.layoutSubviews()

		self.setupLayout()
		self.setupAppearance()
	}
}

extension NoteTableView: ITableView {
	// MARK: - Public Methods
	func reloadData() {
		DispatchQueue.main.async{
			self.tableView.reloadData()
		}
	}

}

// MARK: - Appearances
private extension NoteTableView {
	func setupAppearance() {
		self.setupViewAppearance()
	}

	func setupViewAppearance() {
		self.backgroundColor = .white
	}

	func setupTableAppearance() -> UITableView {
		let table = UITableView(frame: .zero, style: .plain)
		table.register(NoteViewCell.self, forCellReuseIdentifier: NoteViewCell.reuseIdentifier)
		return table
	}

}

// MARK: - Layout
private extension NoteTableView {
	func setupLayout() {
		self.setupMainViewLayout(main: self.tableView)
	}

	func setupMainViewLayout(main view: UIView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(view)
		NSLayoutConstraint.activate([
			view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
			])
	}

}
