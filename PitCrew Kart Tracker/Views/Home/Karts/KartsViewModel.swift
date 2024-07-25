
import Foundation
import Combine

final class KartsViewModel: ObservableObject {
    
    let kartData: KartData
    
    var sheetFixed: Bool
    
    var isKartsEmpty: Bool {
        kartData.karts.isEmpty
    }
    
    private var kartDataCancellable: AnyCancellable?
    
    init(kartData: KartData) {
        self.kartData = kartData
        sheetFixed = kartData.karts.isEmpty
        kartDataCancellable = kartData.$karts.sink { [weak self] karts in
            self?.sheetFixed = karts.isEmpty
            self?.objectWillChange.send()
        }
    }
    
}
