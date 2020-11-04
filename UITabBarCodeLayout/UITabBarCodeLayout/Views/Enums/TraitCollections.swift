//
//  TraitCollections.swift
//  UITabBarCodeLayout
//
//  Created by xdrond on 02.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

enum SizeClass {
	// Portrait.
	case compactRegular
	// Landscape.
	case compactCompact
	// Landscape.
	case regularCompact
	// iPad's.
	case regularRegular
	// Unspecified.
	case unspecified

	static var current: SizeClass {
		let current = UIScreen.main.traitCollection
		switch (current.horizontalSizeClass, current.verticalSizeClass) {
		case (.compact, .regular):
			return .compactRegular
		case (.compact, .compact):
			return .compactCompact
		case (.regular, .compact):
			return .regularCompact
		case (.regular, .regular):
			return .regularRegular
		default:
			return .unspecified
		}
	}
}
