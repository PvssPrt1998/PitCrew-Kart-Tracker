import SwiftUI

final class KartData: ObservableObject {
    
    private weak var dataManager: DataManager?
    
    @Published var kartingPlace: KartingPlace?// = KartingPlace(pic: "car", title: "Title", address: "Address")
    
    @Published var karts: Array<Kart> = []
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func setKartingPlace(_ kartingPlace: KartingPlace) {
        DispatchQueue.main.async { [weak self] in
            self?.dataManager?.localStorage.saveKartingPlace(kartingPlace)
        }
        self.kartingPlace = kartingPlace
    }
    
    func setKart(_ kart: Kart) {
        DispatchQueue.main.async { [weak self] in
            self?.dataManager?.localStorage.saveKart(kart)
        }
        self.karts.append(kart)
    }
}
