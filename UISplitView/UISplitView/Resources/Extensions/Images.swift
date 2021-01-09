//
//  Images.swift
//  UISplitView
//
//  Created by xdrond on 09.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

enum AssetsImage: String {
	// Images.
	case firstImage
	case secondImage

}

extension UIImage {
	static func appImage(_ name: AssetsImage) -> UIImage {
		guard let image = UIImage(named: name.rawValue) else {
			assertionFailure("Image '\(name.rawValue)' not found!")
			return UIImage()
		}
		return image
	}
}
