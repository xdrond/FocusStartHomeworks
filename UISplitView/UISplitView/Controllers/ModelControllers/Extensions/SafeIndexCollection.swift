//
//  SafeIndexCollection.swift
//  UISplitView
//
//  Created by xdrond on 10.11.2020.
//  Copyright © 2020 xdrondrr. All rights reserved.
//

extension Collection where Indices.Iterator.Element == Index {
	public subscript(safe index: Index) -> Iterator.Element? {
		return (startIndex <= index && index < endIndex) ? self[index] : nil
	}
}
