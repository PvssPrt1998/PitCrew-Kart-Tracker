

import Foundation
import Combine

final class KartCollectionViewModel: ObservableObject {
    
    let kartData: KartData
    
    var kartsCount: Int {
        kartData.karts.count
    }
    
    private var kartDataCancellable: AnyCancellable?
    
    init(kartData: KartData) {
        self.kartData = kartData
        
        kartDataCancellable = kartData.$karts.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    func getKart(by index: Int) -> Kart {
        kartData.karts[index]
    }
}

