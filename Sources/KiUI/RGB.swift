//
//  RGB.swift
//  
//
//  Created by Daniel Leuck on 2022/02/14.
//

import SwiftUI
import KiCore

public struct RGB: Hashable, Codable, Equatable, CustomStringConvertible {

    public static let range = 0.0...1.0
    public static let clear = RGB(0, 0, 0, alpha: 0)
    
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
    
    public init(_ red: Double = 0, _ green: Double = 0, _ blue: Double = 0, alpha: Double = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    func brightness(_ mod: Double) -> RGB {
        RGB(
            (red * mod).clamp(RGB.range),
            (blue * mod).clamp(RGB.range),
            (green * mod).clamp(RGB.range),
            alpha: alpha
        )
    }
    
    var color: Color { Color(red: red, green: green, blue: blue, opacity: alpha) }
    
    public var description: String {
        return "r:\(red), g:\(green), b:\(blue)\(alpha == 1 ? "" : ", alpha:\(alpha)")"
    }
    
    public var id: Int { description.hashValue }
    
    public static func == (lhs: RGB, rhs: RGB) -> Bool {
        return lhs.description == rhs.description
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(red)
        hasher.combine(green)
        hasher.combine(blue)
        hasher.combine(alpha)
    }
}
