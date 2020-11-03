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
	case CompactRegular
	// Landscape.
	case CompactCompact
	// Landscape.
	case Regularcompact
	// iPad's.
	case RegularRegular
	// Unspecified.
	case unspecified

	static var current: SizeClass {
		let current = UIScreen.main.traitCollection
		switch (current.horizontalSizeClass, current.verticalSizeClass) {
		case (.compact, .regular):
			return .CompactRegular
		case (.compact, .compact):
			return .CompactCompact
		case (.regular, .compact):
			return .Regularcompact
		case (.regular, .regular):
			return .RegularRegular
		default:
			return .unspecified
		}
	}
}
