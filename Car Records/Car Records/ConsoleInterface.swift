//
//  ConsoleInterface.swift
//  Car Records
//
//  Created by xdrond on 17.10.2020.
//  Copyright © 2020 romanromanov. All rights reserved.
//

class ConsoleInterface {
	private lazy var modelController = ModelController()

	func runLoop() {
		print(Text.onboarding)
		print(Text.help)
		while true {
			if let input = inputCommand() {
				switch input {
				case .help:
					print(Text.help)
				case .add:
					print(Text.addCar)
					enterCarProperties()
				case .show:
					showList(list: modelController.getAll())
				case .filter:
					let body = selectBody(list: modelController.getAllBodyTypes())
					showList(list: modelController.filterByBody(bodyType: body))
				case .exit:
					// Точка выхода.
					print("Программа завершена.")
					return
				}
			} else {
				print("Неизвестная команда.")
			}
		}
	}

	func showList(list: [CarModel]) {
		if list.isEmpty {
			print("Нет добавленных машин. Воспользуйтесь 'add', чтобы добавить запись.")
		} else {
			print("Список доступных машин: ")
			list.forEach{ modelController.printCarDescription(car: $0) }
		}
	}

	func enterCarProperties() {
		// Если необходимо, можно заменить выброс в главное меню
		// валидацией на каждом свойстве с бесконечными попытками.
		// Но тогда уже лучше будет вынести функционал считывания в отдельный метод,
		// потому что даже минимальная проверка на EOF порождает большое количество
		// повторяемого кода.
		print("Введите производителя:")
		guard let manufacturer = readLine() else {
			print("Слишком длинное название производителя.")
			return
		}
		print("Введите модель:")
		guard let model = readLine() else {
			print("Слишком длинное название модели.")
			return
		}
		print("Выберите тип кузова.")
		let body = selectBody(list: modelController.getAllBodyTypes())
		print("Год выпуска (нажимите Enter, чтобы пропустить):")
		guard let rawYearOfIssue = readLine() else {
			print("Вероятно, эта машина выйдет ещё очень нескоро.")
			return
		}
		let yearOfIssue = rawYearOfIssue.isEmpty ? nil : Int(rawYearOfIssue)
		print("Гос. номер:")
		guard let rawСarNumber = readLine() else {
			print("Вероятно, эта машина выйдет ещё очень нескоро.")
			return
		}
		let carNumber = rawСarNumber.isEmpty ? nil : rawСarNumber

		let newCar = modelController.addCar(manufacturer: manufacturer,
											model: model,
											body: body,
											yearOfIssue: yearOfIssue,
											carNumber: carNumber)
		print("Новый автомобиль внесён в список: ")
		modelController.printCarDescription(car: newCar)
	}

	func selectBody(list: [String]) -> CarModel.Body {
		print("Доступные типы кузова:")
		list.enumerated().forEach{ (index,body) in print("\t\(index) - \(body)") }

		repeat {
			print("Введите номер кузова: ")
			if let number = Int(readLine()!) {
				// Диапазон допустимых вариантов
				if number >= 0 && number < list.underestimatedCount {
					// Точка выхода.
					return CarModel.Body.allCases[number]
				}
			} else {
				print("Введено некорректное значение.")
			}
		} while true
	}
}

// MARK:- Тексты пользовательского интерфейса.
extension ConsoleInterface {
	enum Text {
		static let onboarding = """
			Добро пожаловать в программу учёта автомобилей.
		Программа предоставляет возможности добавления новых автомобилей,
		просмотра списка добавленных и фильтрации.
		"""
		static let help = """
			Справка по интерфейсу(введите, чтобы перейти в необходимый раздел):
		'help' - вывести текущее окно справки;
		'add' - добавить автомобиль;
		'show' - отобразить список машин;
		'filter' - отфильтровать по типу кузова;
		'exit' - завершить программу.
		"""
		static let addCar = """
			Заполните данные по порядку. Для перехода к следующему полю нажмите Enter.
		Поля "производитель" и "модель" - обязательные.
		"""
	}
}

// MARK:- Методы для частичной валидации readLine().
extension ConsoleInterface {
	enum UserCommands: String, CaseIterable {
		case help, add, show, filter, exit
	}

	func inputCommand() -> UserCommands? {
		if let userInput = UserCommands(rawValue: readLine()!.lowercased()) {
			return userInput
		}
		return nil
	}
}
