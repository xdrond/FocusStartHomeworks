//
//  MenuButtonsBuilder.swift
//  NotesAppleMVC
//
//  Created by xdrond on 24.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

struct MenuButtonsBuilder {
	func build(colors: [AssetsColor], commonSelector: Selector) -> UIStackView{
		let stack = UIStackView()
//		let UIColors = colors.map { UIColor.appColor($0) }
		colors.forEach {
			let button = buildColouredButton(color: $0, selector: commonSelector)
			stack.addArrangedSubview(button)
		}
		return stack
	}

	private func buildColouredButton(color: AssetsColor, selector: Selector) -> UIButton {
		let button = UIButton(frame: CGRect(x: 0,
											y: 0,
											width: 48,
											height: 48))

		button.addTarget(self,
						 action: selector,
						 for: .touchUpInside)
		button.accessibilityIdentifier = color.rawValue
		button.backgroundColor = UIColor.appColor(color)
		button.layer.cornerRadius = 48 / 2
		button.layer.borderWidth = 1
		button.layer.borderColor = UIColor.lightGray.cgColor

		return button
	}
}
