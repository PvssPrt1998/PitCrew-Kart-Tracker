


import SwiftUI

struct UserLoadingView: View {
    
    @ObservedObject var viewModel: LoadingViewModel

    var body: some View {
        ZStack {
            Image(ImageTitles.UserLoadingBackground.rawValue)
                .resizable()
                .background(Color.black)
                .ignoresSafeArea()
            LogoUserLoadingView()
            CustomProgressView(value: $viewModel.value)
        }
    }
}

struct UserLoadingView_Preview: PreviewProvider {
    
    static var previews: some View {
        UserLoadingView(viewModel: LoadingViewModel(dataManager: DataManager()))
    }
}
