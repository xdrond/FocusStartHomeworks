//
//  DetailController.swift
//  UISplitView
//
//  Created by xdrond on 08.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class DetailController: UIViewController {

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
		self.view = DetailView()
	}

	// MARK: - Private Methods
	private func setupNavigationItem() {
		self.navigationItem.title = "Подробно"
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
}
