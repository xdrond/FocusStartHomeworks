//
//  NoteDetailView.swift
//  NotesAppleMVC
//
//  Created by xdrond on 20.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

import UIKit

final class NoteDetailView: UIView {

	// MARK: - Private Properties
	private weak var delegate: ISaveButtonPressedDelegate?

	private lazy var textView: UITextView = UITextView()
	private lazy var saveButton: UIButton = UIButton()
	private lazy var changeColorButtons: UIStackView = self.createButtons()

	private var color: UIColor? { didSet { self.updateBackgroundColors(color: self.color) } }
	private var noteText: String { didSet { self.textView.text = self.noteText } }

	// MARK: - Private Methods
	@objc private func saveButtonPressed() {
		self.noteText = self.textView.text
		self.delegate?.saveButtonPressed()
	}

	@objc private func changeColorPressed(sender: UIButton) {
		self.accessibilityIdentifier = sender.accessibilityIdentifier
		self.color = sender.backgroundColor
	}

	// MARK: - Initializers
	init(noteText: String, color: UIColor?, delegate: ISaveButtonPressedDelegate) {
		self.noteText = noteText
		self.color = color
		self.delegate = delegate

		super.init(frame: .zero)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle
	override func layoutSubviews() {
		super.layoutSubviews()
		self.setupLayout()
		self.setupAppearance()
	}
}

extension NoteDetailView: INoteDetailView {

	var text: String {
		get{ return self.noteText }
		set{ self.noteText = newValue }
	}

	var noteUIColor: UIColor? {
		get { return self.color}
		set { self.color = newValue }
	}

	var noteColor: String? {
		get { return self.accessibilityIdentifier }
		set { self.accessibilityIdentifier = newValue }
	}
}


private extension NoteDetailView {
	func createButtons() -> UIStackView {
		let builder = MenuButtonsBuilder()
		let stack = builder.build(colors: AssetsColor.allCases,
								  commonSelector: #selector(changeColorPressed(sender: )) )
		return stack
	}

	func updateBackgroundColors(color: UIColor?) {
		self.backgroundColor = color
		self.textView.backgroundColor = color
		self.changeColorButtons.backgroundColor = color
	}

}

// MARK: - Layout
private extension NoteDetailView {
	func setupLayout() {
		// Place of lazy initialization subviews.
		self.setupSaveButtonLayout(view: self.saveButton)
		self.setupChangeColorsButtonsLayout(view: self.changeColorButtons)
		self.setupTextViewLayout(view: self.textView)
	}

	func setupSaveButtonLayout(view: UIView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(view)
		let safeArea = self.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			view.topAnchor.constraint(equalTo: safeArea.topAnchor),
			view.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
			view.widthAnchor.constraint(equalToConstant: 48),
			view.heightAnchor.constraint(equalToConstant: 48)
			])
	}

	func setupChangeColorsButtonsLayout(view: UIView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(view)
		let safeArea = self.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			view.topAnchor.constraint(equalTo: safeArea.topAnchor),
			view.heightAnchor.constraint(equalTo: self.saveButton.heightAnchor),
			view.leftAnchor.constraint(equalTo: self.saveButton.rightAnchor),
			view.rightAnchor.constraint(equalTo: safeArea.rightAnchor)
			])

	}

	func setupTextViewLayout(view: UIView) {
		view.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(view)
		let safeArea = self.safeAreaLayoutGuide
		NSLayoutConstraint.activate([
			view.topAnchor.constraint(equalTo: self.saveButton.bottomAnchor),
			view.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
			view.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
			view.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
			])
	}
	
}

// MARK: - TODO: Move '48' and other numbers to Constant struct/enum.
// MARK: - Appearances
private extension NoteDetailView {
	func setupAppearance() {
		self.backgroundColor = self.color
		self.setupSaveButtonAppearance(view: self.saveButton)
		self.setupChangeColorsButtonsAppearance(view: self.changeColorButtons)
		self.setupTextViewAppearance(view: self.textView)
	}

	func setupSaveButtonAppearance(view: UIButton) {
		view.frame = CGRect(x: 0,
							y: 0,
							width: 48,
							height: 48)
		view.addTarget(self,
					   action: #selector(saveButtonPressed),
					   for: .touchUpInside)

		view.backgroundColor = .white
		view.setTitle("💾", for: .normal)
		view.titleLabel?.numberOfLines = 1
		view.layer.cornerRadius = view.frame.height / 2
		view.layer.borderWidth = 2
		view.layer.borderColor = UIColor.lightGray.cgColor
	}

	func setupChangeColorsButtonsAppearance(view: UIStackView) {
		view.distribution = .fillEqually
	}

	func setupTextViewAppearance(view: UITextView) {
		self.textView.backgroundColor = self.color?.withAlphaComponent(1.0)
		self.textView.font = UIFont(name: "Helvetica", size: 16)
	}

}
