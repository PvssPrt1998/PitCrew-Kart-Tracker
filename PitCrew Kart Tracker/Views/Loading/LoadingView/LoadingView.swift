
import SwiftUI
import Combine

struct ReviewerLoadingView: View {
    
    @ObservedObject var viewModel: LoadingViewModel

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image("LoadingScreenLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 340)
                .padding(.bottom, 182)
            CustomProgressView(value: $viewModel.value)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
            viewModel.setScreenshotTaken()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIScreen.capturedDidChangeNotification)) { _ in
            viewModel.setRecorded()
        }
        .onAppear(perform: {
            viewModel.checkAppType()
        })
    }
}

struct ReviewerLoadingView_Preview: PreviewProvider {
    
    static var previews: some View {
        ReviewerLoadingView(viewModel: LoadingViewModel(dataManager: DataManager()))
    }
}
