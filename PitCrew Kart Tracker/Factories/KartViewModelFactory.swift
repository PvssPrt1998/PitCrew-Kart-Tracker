import Foundation

final class KartViewModelFactory {
    
    let kartData: KartData
    
    init(kartData: KartData) {
        self.kartData = kartData
    }
    
    func makeKartCollectionViewModel() -> KartCollectionViewModel {
        KartCollectionViewModel(kartData: kartData)
    }
    
    func makeKartsViewModel() -> KartsViewModel {
        KartsViewModel(kartData: kartData)
    }
    
    func makeKartingPlaceViewModel() -> KartingPlaceViewModel {
        KartingPlaceViewModel(kartData: kartData)
    }
    
    func makeKartAddViewModel() -> KartAddViewModel {
        KartAddViewModel(kartData: kartData)
    }
    
    func makeKartingPlaceContainerViewModel() -> KartingPlaceContainerViewModel {
        KartingPlaceContainerViewModel(kartData: kartData)
    }
    
    func makeKartingPlaceAddViewModel() -> KartingPlaceAddViewModel {
        KartingPlaceAddViewModel(kartData: kartData)
    }
}
