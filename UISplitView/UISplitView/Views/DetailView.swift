//
//  DetailView.swift
//  UISplitView
//
//  Created by xdrond on 09.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class DetailView: UIView {

	// MARK: - Private Properties
	private let scrollView = UIScrollView()

	private let storyText = UILabel()
	private let firstImage = UIImage()
	private let secondImage = UIImage()

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
private extension DetailView {
	func setupViewsAppearance() {

	}
}

// MARK: - Layout
private extension DetailView {
	func setupViewsLayout() {

	}
}
