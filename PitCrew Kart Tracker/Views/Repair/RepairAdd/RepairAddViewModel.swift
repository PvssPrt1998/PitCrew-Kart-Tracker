

import Foundation

final class RepairAddViewModel: ObservableObject {
    
    let repairData: RepairData
    
    @Published var nameText = "" {
        didSet {
            allEnteredCheck()
        }
    }
    @Published var costText = "" {
        didSet {
            allEnteredCheck()
        }
    }
    
    var disabled: Bool = true
    
    init(repairData: RepairData) {
        self.repairData = repairData
    }
    
    func addButtonPressed() {
        let costFiltered = costText.filter { Set("0123456789").contains($0) }
        guard let cost = Int(costFiltered) else { return }
        repairData.setRepair(Repair(title: nameText, cost: cost))
    }
    
    private func allEnteredCheck() {
        var disabled = false
        if nameText == "" || costText == ""{
            disabled = true
        }
        self.disabled = disabled
    }

}
