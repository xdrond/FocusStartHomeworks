//
//  main.swift
//  ThreadSafeArray
//
//  Created by xdrond on 24.10.2020.
//  Copyright © 2020 romanromanov. All rights reserved.
//

import Dispatch

var arrayMainSafe = ThreadSafeArray<String>()
let repeating = 1000

func task(array: ThreadSafeArray<String>, repeating: Int) {
	for number in 0...(repeating-1) {
		array.append("task with \(number)")
	}
}

let concurrentQueue = DispatchQueue.global(qos: .userInitiated)

for _ in 0...1{
	concurrentQueue.async{ task(array: arrayMainSafe, repeating: repeating) }
}


sleep(2)
print("\nРазмер массива: \(arrayMainSafe.count)")
