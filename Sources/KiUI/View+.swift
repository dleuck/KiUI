import SwiftUI

public extension View {
    func hspace(_ size: Double) -> some View { Spacer().frame(width: size) }
    func vspace(_ size: Double) -> some View { Spacer().frame(height: size) }
    
    func detectOrientation(_ orientation: Binding<UIDeviceOrientation>) -> some View {
        modifier(DetectOrientation(orientation: orientation))
    }
    
    var isPad: Bool { UIDevice.current.userInterfaceIdiom == .pad }
    
    var isPhone: Bool { UIDevice.current.userInterfaceIdiom == .phone }
}

