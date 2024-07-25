import SwiftUI

struct MainWebView: View {
    @State var isLoaderVisible = true
    @StateObject var viewModel = WebViewModel()
    var dataManager: DataManager
    
    let url: String
    
    var body: some View {
        ZStack {
            WebView(viewModel: viewModel, dataManager: dataManager, type: .public, url: url)
                .onReceive(self.viewModel.isLoaderVisible.receive(on: RunLoop.main)) { value in
                    self.isLoaderVisible = value
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            if isLoaderVisible {
                ProgressView()
            }
        }
        .background(Color.white)
    }
}
