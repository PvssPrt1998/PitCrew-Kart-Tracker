
import SwiftUI

struct MainUserView: View {
    
    @ObservedObject var viewModel: MainUserViewModel
    
    var body: some View {
        MainWebView(url: viewModel.url)
    }
}

#Preview {
    MainUserView(viewModel: MainUserViewModel(dataManager: DataManager()))
}
