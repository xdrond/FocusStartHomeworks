//
//  MasterViewCell.swift
//  UISplitView
//
//  Created by xdrond on 09.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class MasterViewCell: UITableViewCell {

	// MARK: - Public Properties
	static let reuseIdentifier = "MasterViewCell"

	let header = UILabel()
	let storyPart = UILabel()
	let time = UILabel()

	// MARK: - Initializers
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		self.setupAppearance()
		self.setupLayout()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}

// MARK: - Appearances
private extension MasterViewCell {
	func setupAppearance() {
		self.setupHeaderAppearance()
		self.setupStoryPartAppearance()
		self.setupTimeAppearance()
	}

	func setupHeaderAppearance(){
		self.header.text = "Заголовок"
		self.header.lineBreakMode = .byWordWrapping
		self.header.numberOfLines = 2
	}

	func setupStoryPartAppearance(){
		self.storyPart.text = "Начало длинного текста"
		self.storyPart.numberOfLines = 2
		self.storyPart.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
	}

	func setupTimeAppearance(){
		self.time.text = "4:20"
		self.time.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
	}

}

// MARK: - Layout
private extension MasterViewCell {
	func setupLayout() {
		self.setupHeaderLayout()
		self.setupStoryPartLayout()
		self.setupTimeLayout()
	}

	func setupHeaderLayout(){
		self.header.translatesAutoresizingMaskIntoConstraints = false
		self.contentView.addSubview(self.header)
		self.header.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor).isActive = true
		self.header.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
		self.header.widthAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 0.6).isActive = true
	}

	func setupStoryPartLayout(){
		self.storyPart.translatesAutoresizingMaskIntoConstraints = false
		self.contentView.addSubview(self.storyPart)
		self.storyPart.topAnchor.constraint(equalTo: self.header.bottomAnchor).isActive = true
		self.storyPart.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
		self.storyPart.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
	}

	func setupTimeLayout(){
		self.time.translatesAutoresizingMaskIntoConstraints = false
		self.contentView.addSubview(self.time)
		self.time.leadingAnchor.constraint(equalTo: self.storyPart.trailingAnchor).isActive = true
		self.time.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor).isActive = true
		self.time.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
	}

}
