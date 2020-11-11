//
//  MasterController.swift
//  UISplitView
//
//  Created by xdrond on 08.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class MasterController: UIViewController {

	// MARK: - Private Properties
	private let modelController = ModelController()
	private let dataSource = MasterTableViewDataSource()

	// MARK: - Initializers
	init() {
		super.init(nibName: nil, bundle: nil)

		setupNavigationItem()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle
	override func loadView() {
		self.view = MasterView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		guard let view = self.view as? MasterView else { return }
		view.tableViewDelegate = self
		view.dataSource = self.dataSource
	}
	
	// MARK: - Private Methods
	private func setupNavigationItem() {
		self.navigationItem.title = "ДЗ Номер 4"
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
	
}

extension MasterController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let controller = DetailController()
		controller.navigationItem.title = self.modelController.getPosts()[indexPath.row].header
		self.showDetailViewController(UINavigationController(rootViewController: controller), sender: nil)
	}
}

