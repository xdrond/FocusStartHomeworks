//
//  UIColor.swift
//  NotesAppleMVC
//
//  Created by xdrond on 24.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

enum AssetsColor: String, CaseIterable {
	case blue
	case green
	case yellow
}

extension UIColor {
	static func appColor(_ name: AssetsColor) -> UIColor? {
		guard let color = UIColor(named: name.rawValue) else {
			assertionFailure("Cannot find color in assets with the name \(name.rawValue)!")
			return nil
		}
		return color
	}
}


