//
//  ModelController.swift
//  Car Records
//
//  Created by xdrond on 17.10.2020.
//  Copyright © 2020 romanromanov. All rights reserved.
//

class ModelController {
	private var cars: [CarModel] = []
	
	func getAll() -> [CarModel] {
		return cars
	}
	
	func addCar(manufacturer: String,
				model: String,
				body: CarModel.Body,
				yearOfIssue: Int?,
				carNumber: String?) -> CarModel{
		let newCar = CarModel(manufacturer: manufacturer,
							  model: model,
							  body: body,
							  yearOfIssue: yearOfIssue,
							  carNumber: carNumber)
		cars.append(newCar)
		return newCar
	}

	func printCarDescription(car: CarModel) {
		print("Производитель: \(car.manufacturer)")
		print("Модель: \(car.model)")
		print("Тип кузова: \(car.body.rawValue)")
		if let yearOfIssue = car.yearOfIssue {
			print("Год производства: \(yearOfIssue)")
		} else {
			print("Год производства: -")
		}
		if let carNumber = car.carNumber { print("Гос. номер: \(carNumber)") }
	}

	func getAllBodyTypes() -> [String] {
		return CarModel.Body.allCases.map{ $0.rawValue }
	}
	
	func filterByBody(bodyType: CarModel.Body) -> [CarModel] {
		return cars.filter{$0.body == bodyType}
	}
	
}
