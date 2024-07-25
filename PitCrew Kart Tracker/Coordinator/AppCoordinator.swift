import SwiftUI
import Combine

final class AppCoordinator: ObservableObject {
    
    enum Pages {
        case loading
        case onboarding
        case main
        
        case userLoading
        case userOnboarding
        case webView
    }
    
    enum WebViewAppPages {
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
        case .userLoading:
            userLoadingView()
        case .userOnboarding:
            userOnboardingView()
        case .webView:
            webView()
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
    
    private func userLoadingView() -> some View {
        let view = UserLoadingView()
        bind(view)
        return view
    }
    
    private func bind(_ view: UserLoadingView) {
        dictionaryAnyCancellable[.userLoading] = view.loaded
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.page = .userOnboarding
            }
    }
    
    private func userOnboardingView() -> some View {
        let view = appContainer.userOnboardingView()
        bind(view.viewModel)
        return view
    }
    
    private func bind(_ viewModel: UserOnboardingViewModel) {
        dictionaryAnyCancellable[.userOnboarding] = viewModel.toNext
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.page = .webView
            }
    }
    
    private func webView() -> some View {
        appContainer.mainUserView()
    }
    
    private func bind(_ viewModel: LoadingViewModel) {
        dictionaryAnyCancellable[.loading] = viewModel.loaded
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                if value {
                    self?.page = .userLoading
                } else {
                    self?.page = .onboarding
                }
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
