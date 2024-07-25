import SwiftUI

struct MainWebView: View {
    @State var isLoaderVisible = true
    @StateObject var viewModel = WebViewModel()

    let url: String
    
    var body: some View {
        ZStack {
            WebView(viewModel: viewModel, type: .public, url: url)
                .onReceive(self.viewModel.isLoaderVisible.receive(on: RunLoop.main)) { value in
                    self.isLoaderVisible = value
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            if isLoaderVisible {
                ProgressView()
            }
        }
        .background(Color.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
