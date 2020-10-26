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
		get { return self.array.isEmpty }
	}
	
	public var count: Int {
		get { return self.array.count }
	}
	
	public func append(_ newElement: Element) {
		serialPrivateQueue.async { self.array.append(newElement) }
	}
	
	public func remove(at index: Int) -> Element {
		let element = self.array[index]
		serialPrivateQueue.async { self.array.remove(at: index) }
		return element
	}
	
	public subscript(index: Int) -> Element {
		get { return self.array[index] }
		set {
			serialPrivateQueue.async { self.array[index] = newValue }
		}
	}
	
	public func contains(_ element: Element) -> Bool {
		return self.array.contains(element)
	}
}
