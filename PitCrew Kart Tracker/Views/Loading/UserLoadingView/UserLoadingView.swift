import SwiftUI
import Combine

struct UserLoadingView: View {
    
    let loaded = PassthroughSubject<Bool, Never>()
    
    @State var value: Double = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.userLoadingGradient1, Color.userLoadingGradient2]), startPoint: .topLeading, endPoint: .bottomTrailing)
            Image(ImageTitles.UserLoadingLogo.rawValue)
                .scaledToFit()
                .frame(width: 315)
            CustomProgressView(value: $value)
        }
        .ignoresSafeArea()
        .onAppear {
            stroke()
        }
    }
    
    private func stroke() {
        if value < 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) {
                self.value += 0.02
                self.stroke()
            }
        } else {
            loaded.send(true)
        }
    }
}

#Preview {
    UserLoadingView()
}
