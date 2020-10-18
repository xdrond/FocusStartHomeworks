//
//  CarModel.swift
//  Car Records
//
//  Created by xdrond on 16.10.2020.
//  Copyright © 2020 romanromanov. All rights reserved.
//

import Foundation

struct CarModel {
	let manufacturer: String
	let model: String
	let body: Body
	let yearOfIssue: Int?
	let carNumber: String?
	
	init(manufacturer: String,
		 model: String,
		 body: Body,
		 yearOfIssue: Int? = nil,
		 carNumber: String? = nil) {
		self.manufacturer = manufacturer
		self.model = model
		self.body = body
		self.yearOfIssue = yearOfIssue
		self.carNumber = carNumber
	}
}

extension CarModel {
	enum Body: String, CaseIterable {
		case sedan = "седан"
		case coupe = "купе"
		case hatchback = "хэтчбэк"
		case minivan = "минивэн"
		case truck = "грузовик"
		case roadster = "родстер"
	}
}
