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

		colors.forEach {
			let button = buildColouredButton(color: $0, selector: commonSelector)
			stack.addArrangedSubview(button)
		}
		return stack
	}

    private enum ButtonAppearance {
        static let width: CGFloat = 48.0
        static let height: CGFloat = 48.0
        static let cornerRadius: CGFloat = 24.0
        static let borderWidth: CGFloat = 1.0
    }

	private func buildColouredButton(color: AssetsColor, selector: Selector) -> UIButton {
		let button = UIButton(frame: CGRect(x: 0,
											y: 0,
                                            width: ButtonAppearance.width,
                                            height: ButtonAppearance.height))

		button.addTarget(self,
						 action: selector,
						 for: .touchUpInside)
		button.accessibilityIdentifier = color.rawValue
		button.backgroundColor = UIColor.appColor(color)
        button.layer.cornerRadius = ButtonAppearance.cornerRadius
        button.layer.borderWidth = ButtonAppearance.borderWidth
		button.layer.borderColor = UIColor.lightGray.cgColor

		return button
	}
}
