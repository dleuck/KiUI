//
//  Device.swift
//  Buttons Layout
//
//  Created by Daniel Leuck on 2023/02/13.
//

import SwiftUI

#if(macOS)
import AppKit
#endif

#if canImport(UIKit)
struct DetectOrientation: ViewModifier {
    @Binding var orientation: UIDeviceOrientation
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                orientation = UIDevice.current.orientation
            }
    }
}
#endif

public struct Screen {
    #if canImport(UIKit)
        public static var width: Double { UIScreen.main.bounds.size.width }
        public static var height: Double { UIScreen.main.bounds.size.height }
        public static var size: Size { UIScreen.main.bounds.size }
    #else
        public static var width: Double { NSScreen.main!.frame.height }
        public static var height: Double { NSScreen.main!.frame.height }
        public static var size: Size { NSScreen.main!.frame.size }
    #endif
}
