
import Foundation
import Combine

final class EmployeesCollectionViewModel: ObservableObject {
    
    let employeesData: EmployeesData
    
    var employeesCount: Int {
        employeesData.employees.count
    }
    
    private var employeesCancellable: AnyCancellable?
    
    init(employeesData: EmployeesData) {
        self.employeesData = employeesData
        
        employeesCancellable = employeesData.$employees.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    
    func getEmployee(by index: Int) -> Employee {
        employeesData.employees[index]
    }
}
