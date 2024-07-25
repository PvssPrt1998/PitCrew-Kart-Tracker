
import Foundation

final class KartAddViewModel: ObservableObject {
    
    @Published var nameText = "" {
        didSet {
            allEnteredCheck()
        }
    }
    @Published var quantityText = "" {
        didSet {
            allEnteredCheck()
        }
    }
    
    @Published var speedText = "" {
        didSet {
            allEnteredCheck()
        }
    }
    
    @Published var imageData: Data? {
        didSet {
            allEnteredCheck()
        }
    }
    
    var disabled: Bool = true
    
    let kartData: KartData
    
    init(kartData: KartData) {
        self.kartData = kartData
    }
    
    func addButtonPressed() {
        let speedFiltered = speedText.filter { Set("0123456789").contains($0) }
        guard let imageData = imageData, let quantity = Int(quantityText), let speed = Int(speedFiltered) else { return }
        kartData.setKart(Kart(pic: imageData, title: nameText, quantity: quantity, maxSpeed: speed))
    }
    
    private func allEnteredCheck() {
        var disabled = false
        if nameText == "" || quantityText == "" || speedText == "" || imageData == nil {
            disabled = true
        }
        self.disabled = disabled
    }
}
