//
//  ModelController.swift
//  UISplitView
//
//  Created by xdrond on 09.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class ModelController {

	// MARK: - Public Methods
	func getPost(at index: Int) -> Post? {
		return self.posts[safe: index]
	}

	func getPosts() -> [Post] {
		return self.posts
	}

	// MARK: - Private Properties
	private var posts: [Post] = []

	// MARK: - Mock data
	private let mockHeader = "VENDÉE GLOBE SOLO, NON-STOP AND WITHOUT ASSISTANCE"
	private let mockStory =
	"""
	To date, the Vendée Globe is the greatest sailing race round the world, solo, non-stop and without assistance. The event followed in the wake of the Golden Globe which had initiated the first circumnavigation of this type via the three capes (Good Hope, Leeuwin and Horn) in 1968. Only one out of the nine pioneers who had set off in 1968 succeeded in returning to Falmouth, the major port of British Cornwall. On 6th April 1969, after 313 days at sea, British sailor Robin Knox-Johnston finally reached his goal. Twenty years later, after having won the BOC Challenge twice(solo round the world with stopovers), navigator Philippe Jeantot introduced the idea of a new race around the world, but..non-stop! The Vendée Globe race was born. On 26th November 1989, thirteen sailors took the start of the first edition which lasted over three months. Only seven returned to Les Sables d'Olonne.

	The eight editions of what is now called the Everest of the seas by the public have enabled 167 contenders to take the start of this extraordinary race. Only 89 of them managed to cross the finish line. This figure alone shows the extreme difficulty of this global event in which solo racers are confronted to freezing cold, gigantic waves and heavy skies which sweep the Great South! The Vendée Globe is first and foremost a journey beyond the seas and deep down oneself… It has rewarded great sailors :TitouanLamazou in 1990, Alain Gautier in 1993, Christophe Auguin in 1997, Vincent Riou in 2005, François Gabart in 2013 and Armel LeCléac'h in 2017. The skipper from Finistère became the new record holder of the race in 74 days. Only one sailor has won it twice : Michel Desjoyeaux, in 2001 and 2009. The 9thVendée Globe will leave Les Sables d'Olonne on Sunday 8thNovember 2020.
	"""
	private let mockFirstImage = UIImage.appImage(.firstImage)
	private let mockSecondImage = UIImage.appImage(.secondImage)

	// MARK: - Private Methods
	private func setupMockModel() {
		if self.posts.isEmpty {
			for _ in 1...5 {
				self.addMockPost()
			}
		}
	}

	private func addMockPost() {
		posts.append(Post(header: self.mockHeader,
						  storyText: self.mockStory,
						  firstImage: self.mockFirstImage,
						  secondImage: self.mockSecondImage))
	}

	// MARK: - Initializers
	init() {
		setupMockModel()
	}

}

// MARK: - UITableViewDataSource
extension ModelController {
	func count() -> Int {
		return self.posts.count
	}

	func postAtIndexPath(forIndexPath: IndexPath) -> Post? {
		if let post = posts[safe: forIndexPath.row] {
			return post
		} else {
			return nil
		}
	}
}
