
import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @State var showUsagePolicy = false
    
    var body: some View {
        ZStack {
            BackgroundContainerView(title: "Settings") {
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        SettingsButton(title: "Rate app", buttonImageTitle: "star.leadinghalf.filled") {
                            SKStoreReviewController.requestReviewInCurrentScene()
                        }
                        SettingsButton(title: "Share app", buttonImageTitle: "square.and.arrow.up") {
                            actionSheet()
                        }
                    }
                    SettingsButton(title: "Usage Policy", buttonImageTitle: "list.bullet.rectangle.portrait") {
                        showUsagePolicy = true
                    }
                }
            }
            if showUsagePolicy {
                usagePolicy()
            }
            Divider().frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    func actionSheet() {
        guard let urlShare = URL(string: "https://apps.apple.com/app/pitcrew-kart-tracker/id6557075909") else { return }
        let activityVC = UIActivityViewController(activityItems: [urlShare], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }

    @ViewBuilder func usagePolicy() -> some View {
        if let url = URL(string: "https://www.termsfeed.com/live/a9e0a1bc-3134-4daa-be9d-47685a69a8a0") {
            UsagePolicyWebView(showWebView: $showUsagePolicy, url: url)
        } else {
            Text("Cannot load usage policy")
        }
    }
}

#Preview {
    SettingsView()
}
