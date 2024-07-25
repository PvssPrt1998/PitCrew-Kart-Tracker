
import SwiftUI

struct MainUserView: View {
    
    @ObservedObject var viewModel: MainUserViewModel
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some View {
        MainWebView(dataManager: viewModel.dataManager, url: viewModel.url)
            .onAppear {
                AppDelegate.orientationLock = UIInterfaceOrientationMask.all
            }

    }
}

#Preview {
    MainUserView(viewModel: MainUserViewModel(dataManager: DataManager()))
}
