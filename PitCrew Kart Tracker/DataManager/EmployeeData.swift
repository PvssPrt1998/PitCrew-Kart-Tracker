import Foundation

final class EmployeesData: ObservableObject {
    
    private weak var dataManager: DataManager?
    
    @Published var employees: Array<Employee> = []
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func setEmployee(_ employee: Employee) {
        DispatchQueue.main.async { [weak self] in
            self?.dataManager?.localStorage.saveEmployee(employee)
        }
        self.employees.append(employee)
    }
}
