

import Foundation
import Combine

final class RepairTableViewModel: ObservableObject {
    
    let repairData: RepairData
    
    var repairsCount: Int {
        repairData.repairs.count
    }
    
    var max: Int {
        calcMax()
    }
    
    private var repairDataCancellable: AnyCancellable?
    
    init(repairData: RepairData) {
        self.repairData = repairData
        
        repairDataCancellable = repairData.$repairs.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    func getRepair(by index: Int) -> Repair {
        repairData.repairs[index]
    }
    
    func calcMax() -> Int {
        if !repairData.repairs.isEmpty {
            return repairData.repairs.max(by: { $0.cost < $1.cost })!.cost
        } else { return 0 }
    }
}
