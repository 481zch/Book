//
//  Color+Extension.swift
//  Book
//
//  Created by zangconghui on 2025/8/27.
//

import UIKit

extension UIColor {
    convenience init(hex: UInt) {
        self.init(hex: hex, alpha: 1.0)
    }
    
    convenience init(hex: UInt, alpha: CGFloat) {
        self.init(
            red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: alpha
        )
    }
    
    static func hex(_ hex: UInt) -> UIColor {
        return UIColor(hex: hex)
    }
    
    func alpha(_ alpha: CGFloat) -> UIColor {
        return withAlphaComponent(alpha)
    }
    
    static func random() -> UIColor {
        return UIColor(red: CGFloat.random(in: 0.0...1.0), green: CGFloat.random(in: 0.0...1.0), blue: CGFloat.random(in: 0.0...1.0), alpha: CGFloat.random(in: 0.0...1.0))
    }
}
