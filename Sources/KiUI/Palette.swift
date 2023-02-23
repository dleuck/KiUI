//
//  File.swift
//  
//
//  Created by Daniel Leuck on 2023/02/23.
//

import Foundation



public struct Palette: Codable {
    
    public static let defaultPalette = Palette(
        name: "default", RGB(102, 71, 216), RGB(43, 139, 49), RGB(208, 178, 26)
    )
    
    public static let trafficLightPalette = Palette(
        name: "traffic", RGB(50, 127, 97), RGB(229, 161, 10), RGB(216, 58, 50)
    )
    
    public static let rainbowPalette = Palette(
        name: "rainbow", RGB(50, 127, 97), RGB(229, 161, 10), RGB(216, 58, 50)
    )
    
    public static let socialPalette = Palette(
        name: "social", RGB(12, 198, 171), RGB(84, 33, 244), RGB(206, 158, 5)
    )
    
    let name: String
    
    let primary: RGB
    let secondary: RGB
    let tertiary: RGB
    
    init(name: String, _ primary: RGB, _ secondary: RGB, _ tertiary: RGB) {
        self.name = name
        
        self.primary = primary
        self.secondary = secondary
        self.tertiary = tertiary
    }
}
