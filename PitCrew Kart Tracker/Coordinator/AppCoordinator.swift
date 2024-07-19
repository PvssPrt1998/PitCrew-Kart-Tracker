import SwiftUI
import Combine

final class AppCoordinator: ObservableObject {
    
    enum Pages {
        case loading
        case onboarding
        case main
    }
    
    @Published var page: Pages = .loading
    
    private let appContainer: AppContainer
    
    private var dictionaryAnyCancellable = Dictionary<Pages, AnyCancellable>()
    
    init(appContainer: AppContainer) {
        self.appContainer = appContainer
    }
    
    @ViewBuilder func build() -> some View {
        switch page {
        case .loading:
            loadingView()
        case .onboarding:
            onboardingView()
        case .main:
            mainView()
        }
    }
    
    private func loadingView() -> some View {
        let viewModel = appContainer.viewModelFactory.makeLoadingViewModel()
        bind(viewModel)
        let view = appContainer.loadingView(viewModel)
        return view
    }
    
    private func onboardingView() -> some View {
        let view = appContainer.onboardingView()
        bind(view.viewModel)
        return view
    }
    
    private func mainView() -> some View {
        appContainer.mainView()
    }
    
    private func bind(_ viewModel: LoadingViewModel) {
        
        dictionaryAnyCancellable[.loading] = viewModel.loaded
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
            self?.page = .onboarding
        }
    }
    
    private func bind(_ viewModel: ReviewerOnboardingViewModel) {
        dictionaryAnyCancellable[.onboarding] = viewModel.toNext
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
            self?.page = .main
        }
    }
}
