import Foundation
import CoreData


extension EmployeeCoreData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmployeeCoreData> {
        return NSFetchRequest<EmployeeCoreData>(entityName: "EmployeeCoreData")
    }

    @NSManaged public var employeeName: String
    @NSManaged public var position: String
    @NSManaged public var workingHours: String

}

extension EmployeeCoreData : Identifiable {

}
