//
//  Images.swift
//  UITabBarCodeLayout
//
//  Created by xdrond on 01.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

enum AssetsImage: String {
	// Images.
	case waterSquare

	// Icons.
	case buttonsIcon
	case landscapeIcon
	case loginIcon
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
