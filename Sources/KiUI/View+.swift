import SwiftUI

public extension View {
    func hspace(_ size: Double) -> some View { Spacer().frame(width: size) }
    func vspace(_ size: Double) -> some View { Spacer().frame(height: size) }
    
    #if canImport(UIKit)
    func detectOrientation(_ orientation: Binding<UIDeviceOrientation>) -> some View {
        modifier(DetectOrientation(orientation: orientation))
    }
    #endif
    
    var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    var isPhone: Bool {
        #if(iOS)
            return UIDevice.current.userInterfaceIdiom == .phone
        #else
            return false
        #endif
    }
    
    var isMac: Bool {
        return (!isPad && !isPhone) ? true : false
    }
}

