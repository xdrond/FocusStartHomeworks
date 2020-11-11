//
//  MasterTableViewDataSource.swift
//  UISplitView
//
//  Created by xdrond on 10.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class MasterTableViewDataSource: NSObject, UITableViewDataSource {

	// MARK: - Private Properties
	private let modelController = ModelController()

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.modelController.count()
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: MasterViewCell.reuseIdentifier,
													   for: indexPath) as? MasterViewCell else {
			assertionFailure("Expected \(MasterViewCell.self) type for reuseIdentifier \(MasterViewCell.reuseIdentifier).")
			return MasterViewCell()
		}

		let post = self.modelController.postAtIndexPath(forIndexPath: indexPath)

		cell.header.text = post?.header
		cell.storyPart.text = post?.storyText

		let formatterForTime = DateFormatter()
		formatterForTime.dateFormat = "HH:mm"
		cell.time.text = formatterForTime.string(from: post!.date)

		// Искажение данных для соответствия ДЗ.
		switch indexPath.row {
		case 0:
			cell.header.numberOfLines = 1
			cell.storyPart.numberOfLines = 1
		case 1:
			cell.storyPart.numberOfLines = 1
		case 2:
			cell.header.numberOfLines = 1
			cell.storyPart.numberOfLines = 1
			cell.time.text = nil
		case 3:
			cell.header.numberOfLines = 1
		case 4:
			cell.header.numberOfLines = 1
			cell.storyPart.text = nil
			cell.time.text = nil
		default:
			print("Default cell")
		}

		return cell
	}

}
