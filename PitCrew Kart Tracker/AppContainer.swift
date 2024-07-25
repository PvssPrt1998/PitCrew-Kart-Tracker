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
    
    func userOnboardingView() -> UserOnboardingTabView {
        UserOnboardingTabView(viewModel: viewModelFactory.makeUserOnboardingTabViewModel())
    }
    
    func mainView() -> some View {
        mainViewContainer.mainView()
    }
    
    func mainUserView() -> some View {
        MainUserView(viewModel: viewModelFactory.makeMainUserViewModel())
    }
    
}
