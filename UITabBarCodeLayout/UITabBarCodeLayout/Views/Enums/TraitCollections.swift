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
	case wChR
	// Landscape.
	case wChC
	// Landscape.
	case wRhC
	// iPad's.
	case wRhR
	// Unspecified.
	case unspecified

	static var current: SizeClass {
		let current = UIScreen.main.traitCollection
		switch (current.horizontalSizeClass, current.verticalSizeClass) {
		case (.compact, .regular):
			return .wChR
		case (.compact, .compact):
			return .wChC
		case (.regular, .compact):
			return .wRhC
		case (.regular, .regular):
			return .wRhR
		default:
			return .unspecified
		}
	}
}
