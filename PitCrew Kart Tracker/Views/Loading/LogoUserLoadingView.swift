import SwiftUI

struct LogoUserLoadingView: View {
    var body: some View {
        VStack(spacing: 0) {
            TextCustom(text: "ONE WAY TO", size: 56, weight: .black, color: .appPrimary, design: .rounded)
                .shadow(color: .darkBlueShadow, radius: 4.88, x: 4.82, y: 3.44)
            TextCustom(text: "WIN", size: 99, weight: .black, color: .white, design: .rounded)
                .shadow(color: .blueShadow, radius: 14.38, x: 7.92, y: 6.7)
        }
        .padding(.bottom, 182)
    }
}

#Preview {
    LogoUserLoadingView()
}
