import Foundation

final class EmployeeViewModelFactory {
    
    let employeesData: EmployeesData
    
    init(employeesData: EmployeesData) {
        self.employeesData = employeesData
    }
    
    func makeEmployeesViewModel() -> EmployeesViewModel {
        EmployeesViewModel(employeesData: employeesData)
    }
    
    func makeEmployeesCollectionViewModel() -> EmployeesCollectionViewModel {
        EmployeesCollectionViewModel(employeesData: employeesData)
    }
    
    func makeEmployeeAddViewModel() -> EmployeeAddViewModel {
        EmployeeAddViewModel(employeesData: employeesData)
    }
}

