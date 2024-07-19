import SwiftUI

final class AppContainer {
    let viewModelFactory: ViewModelFactory
    let mainViewContainer: MainContainer
    let dataManager = DataManager()
    
    init() {
        viewModelFactory = ViewModelFactory(dataManager: dataManager)
        mainViewContainer = MainContainer(viewModelFactory)
    }
    
    func loadingView(_ viewModel: LoadingViewModel) -> ReviewerLoadingView {
        ReviewerLoadingView(viewModel: viewModel)
    }
    
    func onboardingView() -> ReviewerOnboardingView {
        ReviewerOnboardingView(viewModel: viewModelFactory.makeReviewerOnboardingViewModel())
    }
    
    @ViewBuilder func mainView() -> some View {
        mainViewContainer.mainView()
    }
}
