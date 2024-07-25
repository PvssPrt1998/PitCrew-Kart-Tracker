import SwiftUI

struct TintCustomModifier: ViewModifier {
    
    let color: Color
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .tint(color)
        } else {
            content
                .accentColor(color)
        }
    }
}

extension View {
    func tintCustom(_ color: Color) -> some View {
        modifier(TintCustomModifier(color: color))
    }
}
