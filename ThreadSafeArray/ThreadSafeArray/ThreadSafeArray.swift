//
//  ThreadSafeArray.swift
//  ThreadSafeArray
//
//  Created by xdrond on 25.10.2020.
//  Copyright © 2020 romanromanov. All rights reserved.
//

import Dispatch

final public class ThreadSafeArray<Element: Equatable> {
	
	private var array: [Element] = []

	private let serialPrivateQueue = DispatchQueue(label: "ru.threadsafearray.serial",
												   qos: .userInteractive)
	public var isEmpty: Bool {
		return self.serialPrivateQueue.sync { self.array.isEmpty }
	}
	
	public var count: Int {
		return self.serialPrivateQueue.sync { self.array.count }
	}
	
	public func append(_ newElement: Element) {
		self.serialPrivateQueue.async { self.array.append(newElement) }
	}

	public func remove(at index: Int) -> Element {
		return self.serialPrivateQueue.sync {
			guard self.array.indices.contains(index) else {
				fatalError("\(index) - index out of range!")
			}
			return self.array.remove(at: index)
		}
	}

	public subscript(index: Int) -> Element {
		get {
			return self.serialPrivateQueue.sync {
				guard self.array.indices.contains(index) else {
					fatalError("\(index) - index out of range!")
				}
				return self.array[index]
			}
		}
		set {
			self.serialPrivateQueue.async {
				guard self.array.indices.contains(index) else {
					fatalError("\(index) - index out of range!")
				}
				self.array[index] = newValue
			}
		}
	}
	
	public func contains(_ element: Element) -> Bool {
		return self.serialPrivateQueue.sync { self.array.contains(element) }
	}

}
