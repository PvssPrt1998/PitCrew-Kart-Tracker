

import Foundation
import Combine

final class RepairViewModel: ObservableObject {
    
    let repairData: RepairData
    
    var repairsExists: Bool {
        repairData.repairs.count > 0
    }
    
    var totalCost: Int {
        repairData.totalCost
    }
    
    @Published var totalCostText = ""
    
    var repairDataCancellable: AnyCancellable?
    var repairTotalCostCancellable: AnyCancellable?
    
    init(repairData: RepairData) {
        self.repairData = repairData
        
        repairDataCancellable = repairData.$repairs.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
        
        repairTotalCostCancellable = repairData.$totalCost.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
        
    }
    
    func setTotalCost() {
        guard let totalCost = Int(totalCostText) else { return }
        totalCostText = ""
        repairData.setTotalCost(totalCost)
    }
}
