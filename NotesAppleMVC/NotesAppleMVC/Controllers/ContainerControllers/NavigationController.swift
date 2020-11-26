//
//  NavigationController.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {

	// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationBar.prefersLargeTitles = true
    }

}
