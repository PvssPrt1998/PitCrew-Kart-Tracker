import SwiftUI

struct BackgroundImage: View {
    
    let backgroundImageTitle: String
    let color: Color
    
    var body: some View {
        Image(backgroundImageTitle)
            .resizable()
            .background(color)
            .ignoresSafeArea()
    }
}

#Preview {
    BackgroundImage(backgroundImageTitle: ImageTitles.UserOnboardingBackground1.rawValue, color: Color.bgSecond)
}
