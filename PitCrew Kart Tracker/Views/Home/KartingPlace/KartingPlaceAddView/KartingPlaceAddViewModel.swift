
import Foundation

final class KartingPlaceAddViewModel: ObservableObject {
    
    let kartData: KartData
    
    @Published var nameText = "" {
        didSet {
            allEnteredCheck()
        }
    }
    
    @Published var addressText = "" {
        didSet {
            allEnteredCheck()
        }
    }
    
    var disabled: Bool = true
    @Published var imageData: Data?
    
    init(kartData: KartData) {
        self.kartData = kartData
    }
    
    func saveButtonPressed() {
        guard let imageData = imageData else { return }
        kartData.setKartingPlace(KartingPlace(pic: imageData, title: nameText, address: addressText))
    }
    
    private func allEnteredCheck() {
        var disabled = false
        if nameText == "" || addressText == "" {
            disabled = true
        }
        self.disabled = disabled
    }
}
