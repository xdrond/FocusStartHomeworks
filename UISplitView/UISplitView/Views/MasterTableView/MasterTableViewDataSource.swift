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

		//Temp.
		let formatterForTime = DateFormatter()
		formatterForTime.dateFormat = "HH:mm"
		cell.time.text = formatterForTime.string(from: post!.date)

		return cell
	}

}
