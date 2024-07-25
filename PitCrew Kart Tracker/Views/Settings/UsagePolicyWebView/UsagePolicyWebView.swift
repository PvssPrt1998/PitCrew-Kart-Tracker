
import SwiftUI

struct UsagePolicyWebView: View {
    
    @Binding var showWebView: Bool
    @State var isLoaderVisible = true
    @StateObject var viewModel = WebViewModel()

    let url: URL
    
    var body: some View {
        VStack {
            Button {
                showWebView = false
            } label: {
                Text("Close")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            ZStack {
                WebView(viewModel: viewModel, type: .public, url: "https://www.termsfeed.com/live/a9e0a1bc-3134-4daa-be9d-47685a69a8a0")
                    .onReceive(self.viewModel.isLoaderVisible.receive(on: RunLoop.main)) { value in
                        self.isLoaderVisible = value
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                if isLoaderVisible {
                    ProgressView()
                }
            }
        }
        .padding([.horizontal, .top], 16)
        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
