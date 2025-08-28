//
//  String+Extension.swift
//  Book
//
//  Created by zangconghui on 2025/8/27.
//

extension String {
    subscript(index: Int) -> Character {
        let idx = self.index(self.startIndex, offsetBy: index)
        return self[idx]
    }
}
