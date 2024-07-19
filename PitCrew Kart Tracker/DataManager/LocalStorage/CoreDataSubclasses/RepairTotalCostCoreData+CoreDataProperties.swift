import Foundation
import CoreData


extension RepairTotalCostCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RepairTotalCostCoreData> {
        return NSFetchRequest<RepairTotalCostCoreData>(entityName: "RepairTotalCostCoreData")
    }

    @NSManaged public var totalCost: Int32

}

extension RepairTotalCostCoreData : Identifiable {

}
