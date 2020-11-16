//
//  Colors.swift
//  UITabBarCodeLayout
//
//  Created by xdrond on 01.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

enum AssetsColor: String {
	case backgroundColor
	case fontColor
	case spinnerColor
}

extension UIColor {
	static func appColor(_ name: AssetsColor) -> UIColor? {
		guard let color = UIColor(named: name.rawValue) else {
			assertionFailure();
			return nil
		}
		return color
	}
}

