

import SwiftUI

struct OnboardingView: View {
    
    let title: String
    let caption: String
    let backgroundImageTitle: String
    
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    var body: some View {
        ZStack {
            BackgroundImage(backgroundImageTitle: backgroundImageTitle,
                            color: .bgSecond)
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    TextCustom(text: title, size: 28, weight: .bold, color: .white)
                    TextCustom(text: caption, size: 17, weight: .regular, color: .caption)
                    Spacer()
                }
                .padding(EdgeInsets(top: 0,
                                    leading: 15,
                                    bottom: 0,//55 + safeAreaInsets.bottom,
                                    trailing: 15))
                Spacer()
            }
        }
    }
}

#Preview {
    OnboardingView(title: "Employees are under control",
                   caption: "Place a bet on yourself",
                   backgroundImageTitle: ImageTitles.UserOnboardingBackground1.rawValue)
        .background(Color.black)
}
