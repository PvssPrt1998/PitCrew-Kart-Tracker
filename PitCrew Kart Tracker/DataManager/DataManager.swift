import Foundation

protocol LocalStorageProtocol: AnyObject {
    func saveRepairTotalCost(_ totalCost: Int)
    func fetchRepairTotalCost() throws -> Int
    func saveRepair(_ repair: Repair)
    func fetchRepairs() throws -> [Repair]
    func saveEmployee(_ employee: Employee)
    func fetchEmployees() throws -> [Employee]
    func saveKartingPlace(_ kartingPlace: KartingPlace)
    func fetchKartingPlace() throws -> KartingPlace?
    func saveKart(_ kart: Kart)
    func fetchKarts() throws -> [Kart]
}

final class DataManager: ObservableObject {
    
    let localStorage: LocalStorageProtocol = LocalStorage()
    
    @Published var kartingPlace: KartingPlace?
    @Published var karts: Array<Kart> = []
    @Published var employees: Array<Employee> = []
    @Published var repairTotalCost: Int = 0
    @Published var repairs: Array<Repair> = []
    
    @Published var dataLoaded: Bool = false
    @Published var value: Double = 0
    
    func loadData() {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self else { return }
            self.kartingPlace = try? self.localStorage.fetchKartingPlace()
            if let karts = try? self.localStorage.fetchKarts() {
                self.karts = karts
            }
            
            if let employees = try? self.localStorage.fetchEmployees() {
                self.employees = employees
            }
            if let repairTotalCost = try? self.localStorage.fetchRepairTotalCost() {
                self.repairTotalCost = repairTotalCost
            }

            if let repairs = try? self.localStorage.fetchRepairs() {
                self.repairs = repairs
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.value += 0.25
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.value += 0.25
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.value += 0.25
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.value += 0.25
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                self.dataLoaded = true
                            }
                        }
                    }
                }
            }
        }
    }
    
    func stroke(_ completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion()
        }
    }
}
