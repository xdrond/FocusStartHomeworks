//
//  SecondView.swift
//  UITabBarCodeLayout
//
//  Created by xdrond on 30.10.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class SecondView: UIView {

	// MARK: - Private Methods
	private var scrollView = UIScrollView()

	private var image = UIImageView()

	private var title = UILabel()
	private var text = UILabel()
	// Temp placeholder.
	private let textContent =
	"""
	Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur? Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?
	"""

	private var allConstraints: [NSLayoutConstraint] = []
	/**Portrait orientation.
	SizeClass - width Compact, height Regular.
	*/
	private var CompactRegularConstraints: [NSLayoutConstraint] = []
	/**Landscape orientation.
	SizeClass - width Compact, height Compact.
	*/
	private var CompactCompactConstraints: [NSLayoutConstraint] = []
	/**Landscape orientation.
	SizeClass - width Regular, height Compact
	*/
	private var RegularCompactConstraints: [NSLayoutConstraint] = []

	// MARK: - Initializers
	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViewsAppearance()
		setupViewsLayout()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Change Lifecycle
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		setupViewsLayout()
	}
	
}

// MARK: - Private Methods
private extension SecondView {

	// MARK: - Appearances
	enum AppearanceConstants: CGFloat {
		case secondLabelFontSize = 32
	}

	func setupViewsAppearance() {
		setupViewAppearance()

		setupScrollViewAppearance()

		setupImageAppearance()

		setupTitleAppearance()
		setupTextAppearance()
	}

	func setupViewAppearance() {
		self.backgroundColor = UIColor.appColor(.backgroundColor)
	}

	func setupScrollViewAppearance() {}

	func setupImageAppearance() {
		self.image.image = UIImage.appImage(.waterSquare)
		self.image.contentMode = .scaleAspectFill
		self.image.clipsToBounds = true
	}

	func setupTitleAppearance() {
		self.title.text = "Заголовок"
		self.title.numberOfLines = 2
		self.title.font = .boldSystemFont(ofSize: AppearanceConstants.secondLabelFontSize.rawValue)
		self.title.textColor = UIColor.appColor(.fontColor)
		self.title.backgroundColor = UIColor.appColor(.backgroundColor)
	}

	func setupTextAppearance() {
		self.text.text = textContent
		self.text.numberOfLines = 0
		self.text.textColor = UIColor.appColor(.fontColor)
		self.text.backgroundColor = UIColor.appColor(.backgroundColor)
	}

}

// MARK: - Private Methods
private extension SecondView {

	// MARK: - Layout
	func setupViewsLayout() {

		NSLayoutConstraint.deactivate(self.allConstraints)
		self.allConstraints.removeAll()

		switch SizeClass.current {
		case .CompactRegular:
			CompactRegularSetupLayout()
		case .CompactCompact:
			CompactCompactSetupLayout()
		case .Regularcompact:
			RegularCompactSetupLayout()
		default:
			CompactRegularSetupLayout()
			assertionFailure("No constraints are configured for this SizeClass!")
		}

		NSLayoutConstraint.activate(self.allConstraints)
	}

	func CompactRegularSetupLayout() {
		CompactRegularSetupScrollViewLayout()
		CompactRegularSetupImageLayout()
		CompactRegularSetupTitleLayout()
		CompactRegularSetupTextLayout()
	}

	func CompactCompactSetupLayout() {
		CompactCompactSetupScrollViewLayout()
		CompactCompactSetupImageLayout()
		CompactCompactSetupTitleLayout()
		CompactCompactSetupTextLayout()
	}

	func RegularCompactSetupLayout() {
		RegularCompactSetupScrollViewLayout()
		RegularCompactSetupImageLayout()
		RegularCompactSetupTitleLayout()
		RegularCompactSetupTextLayout()
	}

}

// MARK: - CompactRegularSetupLayout
private extension SecondView {
	func CompactRegularSetupScrollViewLayout() {
		self.addSubview(self.scrollView)
		self.scrollView.translatesAutoresizingMaskIntoConstraints = false
		let set = [
			self.scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			self.scrollView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.scrollView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.scrollView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
		]
		self.allConstraints.append(contentsOf: set)
	}

	func CompactRegularSetupImageLayout() {
		self.scrollView.addSubview(self.image)
		self.image.translatesAutoresizingMaskIntoConstraints = false
		let set = [
			self.image.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
			self.image.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.image.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.image.heightAnchor.constraint(equalToConstant: 300)
		]
		self.allConstraints.append(contentsOf: set)
	}

	func CompactRegularSetupTitleLayout() {
		self.scrollView.addSubview(self.title)
		self.title.translatesAutoresizingMaskIntoConstraints = false
		let set = [
			self.title.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 16),
			self.title.heightAnchor.constraint(equalToConstant: 40),
			self.title.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
		]
		self.allConstraints.append(contentsOf: set)
	}

	func CompactRegularSetupTextLayout() {
		self.scrollView.addSubview(self.text)
		self.text.translatesAutoresizingMaskIntoConstraints = false
		let set = [
			self.text.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 16),
			self.text.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
			self.text.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
			self.text.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
		]
		self.allConstraints.append(contentsOf: set)
	}
}

// MARK: - CompactCompactSetupLayout
private extension SecondView {

	func CompactCompactSetupScrollViewLayout() {

	}

	func CompactCompactSetupImageLayout() {

	}

	func CompactCompactSetupTitleLayout() {

	}

	func CompactCompactSetupTextLayout() {

	}

}

// MARK: - RegularCompactSetupLayout
private extension SecondView {

	func RegularCompactSetupScrollViewLayout() {

	}

	func RegularCompactSetupImageLayout() {

	}

	func RegularCompactSetupTitleLayout() {

	}

	func RegularCompactSetupTextLayout() {

	}

}
