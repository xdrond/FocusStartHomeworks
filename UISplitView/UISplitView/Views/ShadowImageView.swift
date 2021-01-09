//
//  ShadowМшуц.swift
//  UISplitView
//
//  Created by xdrond on 14.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class ShadowImageView: UIView {

	// MARK: - Public Properties
	let imageView = UIImageView()

	var cornerRadius: CGFloat = 20.0 {
		didSet { self.imageView.layer.cornerRadius = self.cornerRadius }
	}

	var shadowColor: UIColor = .black {
		didSet { self.layer.shadowColor = self.shadowColor.cgColor }
	}

	var shadowOpacity: Float = 0.7 {
		didSet { self.layer.shadowOpacity = self.shadowOpacity }
	}

	var shadowOffset = CGSize(width: 2.5, height: 2.5) {
		didSet { self.layer.shadowOffset = self.shadowOffset }
	}

	var shadowRadius: CGFloat = 7.0 {
		didSet { self.layer.shadowRadius = self.shadowRadius }
	}


	// MARK: - Initializers
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setup()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	// MARK: - Lifecycle
	override func layoutSubviews() {
		super.layoutSubviews()
		self.setupShadow()
	}

	private func setupShadow() {
		self.layer.shadowColor = self.shadowColor.cgColor
		self.layer.shadowRadius = self.shadowRadius
		self.layer.shadowOpacity = self.shadowOpacity
		self.layer.shadowOffset = self.shadowOffset

		let cgPath = UIBezierPath(roundedRect: self.bounds,
								  byRoundingCorners: [.allCorners],
								  cornerRadii: CGSize(width: self.cornerRadius,
													  height: self.cornerRadius)).cgPath
		layer.shadowPath = cgPath
	}

	private func setup() {
		self.addSubview(self.imageView)

		self.imageView.translatesAutoresizingMaskIntoConstraints = false

		self.imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
		self.imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
		self.imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
		self.imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

		self.imageView.layer.cornerRadius = self.cornerRadius
		self.imageView.clipsToBounds = true
	}
}
