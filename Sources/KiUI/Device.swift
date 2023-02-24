//
//  Device.swift
//  Buttons Layout
//
//  Created by Daniel Leuck on 2023/02/13.
//

import SwiftUI

#if(iOS)
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
    public static var width: Double { UIScreen.main.bounds.size.width }
    public static var height: Double { UIScreen.main.bounds.size.height }
    public static var size: Size { UIScreen.main.bounds.size }
}
