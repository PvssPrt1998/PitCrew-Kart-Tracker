import Foundation

final class RepairData: ObservableObject {
    
    private weak var dataManager: DataManager?
    
    @Published var totalCost: Int = 0
    
    @Published var repairs: Array<Repair> = []
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func setTotalCost(_ totalCost: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.dataManager?.localStorage.saveRepairTotalCost(totalCost)
        }
        self.totalCost = totalCost
    }
    
    func setRepair(_ repair: Repair) {
        DispatchQueue.main.async { [weak self] in
            self?.dataManager?.localStorage.saveRepair(repair)
        }
        self.repairs.append(repair)
    }
}
