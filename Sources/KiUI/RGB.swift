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
    public static let modRange = -1.0...1.0
    
    public static let clear = RGB(0, 0, 0, alpha: 0)
    public static let white = RGB(1, 1, 1)
    public static let black = RGB(0, 0, 0)
    
    public static let red = RGB(1, 0, 0)
    public static let green = RGB(0, 1, 0)
    public static let blue = RGB(0, 0, 1)
    
    public let red: Double
    public let green: Double
    public let blue: Double
    public let alpha: Double
    
    public init(_ red: Double = 0, _ green: Double = 0, _ blue: Double = 0, alpha: Double = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    public func brightness(_ mod: Double) -> RGB {
        RGB(
            (red * mod).clamp(RGB.range),
            (green * mod).clamp(RGB.range),
            (blue * mod).clamp(RGB.range),
            alpha: alpha
        )
    }
    
    /**
     * 0 to 1.0 for lightening, 0 to -1.- for darkening
     */
    public func lightness(_ mod: Double) -> RGB {
        let modifier = mod.clamp(RGB.modRange)
        
        if modifier == 0 {
            return self
        }
        
        return blend(modifier > 0 ? RGB.white : RGB.black, percent: abs(modifier))
    }

    /**
     * Blend in a specified percent (0.0 - 0.1) of the other RGB.
     */
    public func blend(_ other: RGB, percent: Double = 0.5) -> RGB {
        let perc = percent.clamp(RGB.range)

        let newRed = RGB.between(red, other.red, percent: perc)
        let newGreen = RGB.between(green, other.green, percent: perc)
        let newBlue = RGB.between(blue, other.blue, percent: perc)
        let newAlpha = RGB.between(alpha, other.alpha, percent: perc)
        
        return RGB(newRed, newGreen, newBlue, alpha: newAlpha)
    }
    
    // XCTAssertEqual(RGB(0.5, 0, 0).lightness(0.5), RGB(0.75, 0, 0))
    // Error: testIncreateLightness(): XCTAssertEqual failed: ("r:0.75, g:0.5, b:0.5") is not equal to ("r:0.75, g:0.0, b:0.0")
    
    public static func between(_ num1: Double, _ num2: Double, percent: Double = 0.5) -> Double {
        let perc = 1.0 - percent.clamp(RGB.range)
        let dif = abs(num1 - num2)
        
        if num1 == num2 {
            return num1
        }
        
        if num2 < num1 {
            return num2 + perc*dif
        }
        
        return num2 - perc*dif
    }
    
    public var color: Color { Color(red: red, green: green, blue: blue, opacity: alpha) }
    
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

/**
 * Transform a web color (0-255 for color components) to an RGB (0.0-1.0).
 */
public func webRGB(_ red: Double = 0, _ green: Double = 0, _ blue: Double = 0,
                          alpha: Double = 255) -> RGB {
    
    return RGB(red / 255, green / 255, blue / 255, alpha: alpha / 255)
}
