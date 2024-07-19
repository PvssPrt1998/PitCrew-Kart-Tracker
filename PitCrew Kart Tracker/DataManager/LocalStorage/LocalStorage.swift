import Foundation
import CoreData

final class LocalStorage: LocalStorageProtocol {
    
    private let modelName = "PitCrewKartTrackerData"
    
    lazy var coreDataStack = CoreDataStack(modelName: modelName)
    
    func saveRepairTotalCost(_ totalCost: Int) {
        let repairTotalCostCoreData = RepairTotalCostCoreData(context: coreDataStack.managedContext)
        repairTotalCostCoreData.totalCost = Int32(totalCost)
        coreDataStack.saveContext()
    }
    
    func fetchRepairTotalCost() throws -> Int {
        guard let repairTotalCostCoreData = try coreDataStack.managedContext.fetch(RepairTotalCostCoreData.fetchRequest()).first else { return 0 }
        let totalCost = Int(repairTotalCostCoreData.totalCost)
        return totalCost
    }
    
    func saveRepair(_ repair: Repair) {
        let repairCoreData = RepairCoreData(context: coreDataStack.managedContext)
        repairCoreData.title = repair.title
        repairCoreData.cost = Int32(repair.cost)
        coreDataStack.saveContext()
    }
    
    func fetchRepairs() throws -> [Repair] {
        var repairs: Array<Repair> = []
        let repairsCoreData = try coreDataStack.managedContext.fetch(RepairCoreData.fetchRequest())
        repairsCoreData.forEach { repairCoreData in
            repairs.append(Repair(title: repairCoreData.title, cost: Int(repairCoreData.cost)))
        }
        
        return repairs
    }
    
    func saveEmployee(_ employee: Employee) {
        let employeeCoreData = EmployeeCoreData(context: coreDataStack.managedContext)
        employeeCoreData.employeeName = employee.employeeName
        employeeCoreData.position = employee.position
        employeeCoreData.workingHours = employee.workingHours
        coreDataStack.saveContext()
    }
    
    func fetchEmployees() throws -> [Employee] {
        var employees: Array<Employee> = []
        let employeesCoreData = try coreDataStack.managedContext.fetch(EmployeeCoreData.fetchRequest())
        employeesCoreData.forEach { employeeCoreData in
            employees.append(Employee(employeeName: employeeCoreData.employeeName,
                                      position: employeeCoreData.position,
                                      workingHours: employeeCoreData.workingHours))
        }
        
        return employees
    }
    
    func saveKartingPlace(_ kartingPlace: KartingPlace) {
        let kartingPlaceCoreData = KartingPlaceCoreData(context: coreDataStack.managedContext)
        kartingPlaceCoreData.pic = kartingPlace.pic
        kartingPlaceCoreData.title = kartingPlace.title
        kartingPlaceCoreData.address = kartingPlace.address
        coreDataStack.saveContext()
    }
    
    func fetchKartingPlace() throws -> KartingPlace? {
        guard let kartingPlace = try coreDataStack.managedContext.fetch(KartingPlaceCoreData.fetchRequest()).first else { return nil }
        return KartingPlace(pic: kartingPlace.pic, title: kartingPlace.title, address: kartingPlace.address)
    }
    
    func saveKart(_ kart: Kart) {
        let kartCoreData = KartCoreData(context: coreDataStack.managedContext)
        kartCoreData.pic = kart.pic
        kartCoreData.title = kart.title
        kartCoreData.quantity = Int32(kart.quantity)
        kartCoreData.maxSpeed = Int32(kart.maxSpeed)
        coreDataStack.saveContext()
    }
    
    func fetchKarts() throws -> [Kart] {
        var karts: Array<Kart> = []
        let kartsCoreData = try coreDataStack.managedContext.fetch(KartCoreData.fetchRequest())
        kartsCoreData.forEach { kartCoreData in
            karts.append(Kart(pic: kartCoreData.pic, title: kartCoreData.title, quantity: Int(kartCoreData.quantity), maxSpeed: Int(kartCoreData.maxSpeed)))
        }
        
        return karts
    }
}

