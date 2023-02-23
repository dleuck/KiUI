//
//  File.swift
//  
//
//  Created by Daniel Leuck on 2023/02/23.
//

import Foundation



public struct Palette: Codable, CustomStringConvertible {
    
    public let name: String
    
    public let primary: RGB
    public let secondary: RGB
    public let tertiary: RGB
    
    public static let defaultPalette = Palette(
        name: "default", webRGB(102, 71, 216), webRGB(43, 139, 49), webRGB(208, 178, 26)
    )
    
    public static let trafficLightPalette = Palette(
        name: "traffic", webRGB(50, 127, 97), webRGB(229, 161, 10), webRGB(216, 58, 50)
    )
    
    public static let rainbowPalette = Palette(
        name: "rainbow", webRGB(163, 130, 212), webRGB(137, 195, 233), webRGB(250, 234, 144)
    )
    
    public static let socialPalette = Palette(
        name: "social", webRGB(12, 198, 171), webRGB(84, 33, 244), webRGB(206, 158, 5)
    )
    
    public init(name: String, _ primary: RGB, _ secondary: RGB, _ tertiary: RGB) {
        self.name = name
        
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
    }
    
    public var description: String {
        "\(name) - primary:\(primary), secondary:\(secondary), tertiary:\(tertiary)"
    }
}
