import Foundation

final class RepairViewModelFactory {
    
    let repairData: RepairData
    
    init(repairData: RepairData) {
        self.repairData = repairData
    }
    
    func makeRepairAddViewModel() -> RepairAddViewModel {
        RepairAddViewModel(repairData: repairData)
    }
    
    func makeRepairViewModel() -> RepairViewModel {
        RepairViewModel(repairData: repairData)
    }
    
    func makrRepairTableViewModel() -> RepairTableViewModel {
        RepairTableViewModel(repairData: repairData)
    }
}
