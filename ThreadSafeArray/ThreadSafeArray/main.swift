//
//  main.swift
//  ThreadSafeArray
//
//  Created by xdrond on 24.10.2020.
//  Copyright © 2020 romanromanov. All rights reserved.
//

import Dispatch

var arrayMainSafe = ThreadSafeArray<Int>()
let repeating = 1000
let dispatchGroup = DispatchGroup()
let concurrentQueue = DispatchQueue.global(qos: .userInitiated)

dispatchGroup.enter()
concurrentQueue.async{
	for number in 0...repeating {
		arrayMainSafe.append(number)
	}
	dispatchGroup.leave()
}

dispatchGroup.enter()
concurrentQueue.async{
	for number in 0...repeating {
		arrayMainSafe.append(number)
	}
	dispatchGroup.leave()
}


dispatchGroup.wait()

print("\nРазмер массива: \(arrayMainSafe.count)")
// Размер массива: 2002.
