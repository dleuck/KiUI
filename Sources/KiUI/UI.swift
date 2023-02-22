//
//  UI.swift
//
//  Created by Daniel Leuck on 2023/01/17.
//

import SwiftUI

public func rgb(_ r: Double, _ g: Double, _ b: Double, alpha: Double = 1) -> Color {
    return Color(red: r, green: g, blue: b, opacity: alpha)
}

public func gray(_ gray: Double, alpha: Double = 1) -> Color {
    return Color(red: gray, green: gray, blue: gray, opacity: alpha)
}
