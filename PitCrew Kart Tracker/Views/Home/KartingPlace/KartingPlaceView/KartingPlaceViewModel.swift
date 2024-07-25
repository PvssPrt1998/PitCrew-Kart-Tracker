
import Foundation
import Combine

final class KartingPlaceViewModel: ObservableObject {
    
    let kartData: KartData
    
    var kartingPlace: KartingPlace? {
        kartData.kartingPlace != nil ? kartData.kartingPlace! : nil
    }
    
    private var kartDataCancellable: AnyCancellable?
    
    init(kartData: KartData) {
        self.kartData = kartData
        
        kartDataCancellable = kartData.$kartingPlace.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}
