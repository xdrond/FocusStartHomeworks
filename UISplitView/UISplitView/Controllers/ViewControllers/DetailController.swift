//
//  DetailController.swift
//  UISplitView
//
//  Created by xdrond on 08.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class DetailController: UIViewController {

	// MARK: - Public Properties
	var post: Post?

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
		self.view = DetailView(post: self.post)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		guard let post = self.post else { return }
		self.navigationItem.title = post.header
		
	}

	// MARK: - Private Methods
	private func setupNavigationItem() {
		self.navigationController?.navigationBar.prefersLargeTitles = true
	}
}
