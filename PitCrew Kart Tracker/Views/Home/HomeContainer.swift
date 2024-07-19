

import SwiftUI

final class HomeContainer {
    
    let kartViewModelFactory: KartViewModelFactory
    
    init(_ kartViewModelFactory: KartViewModelFactory) {
        self.kartViewModelFactory = kartViewModelFactory
    }
    
    func homeView() -> some View {
        HomeView(container: self)
    }
    
    func kartingPlaceContainerView() -> some View {
        KartingPlaceContainerView(self, viewModel: kartViewModelFactory.makeKartingPlaceContainerViewModel())
    }
    
    func kartingPlaceView() -> some View {
        KartingPlaceView(viewModel: kartViewModelFactory.makeKartingPlaceViewModel())
    }
    
    func kartingPlaceAddView() -> some View {
        KartingPlaceAddView(viewModel: kartViewModelFactory.makeKartingPlaceAddViewModel())
    }
    
    func buildKartsView() -> some View {
        KartsView(container: self, viewModel: kartViewModelFactory.makeKartsViewModel())
    }
    
    func buildKartCollectionView() -> some View {
        KartCollectionView(viewModel: kartViewModelFactory.makeKartCollectionViewModel())
    }
    
    func buildKartAddView() -> some View {
        KartAddView(viewModel: kartViewModelFactory.makeKartAddViewModel())
    }
    
}
