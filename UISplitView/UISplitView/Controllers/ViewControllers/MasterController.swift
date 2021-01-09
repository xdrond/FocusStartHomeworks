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

		splitViewController?.delegate = self

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

// Navigation.
extension MasterController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let controller = DetailController()
		let post = self.modelController.postAtIndexPath(forIndexPath: indexPath)
		controller.post = post

		self.splitViewController?.showDetailViewController(controller, sender: nil)

	}
}

extension MasterController: UISplitViewControllerDelegate {
	func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
		return true
	}
}
