
import Foundation

final class EmployeeAddViewModel: ObservableObject {
    
    let employeesData: EmployeesData
    
    @Published var nameText = "" {
        didSet {
            allEnteredCheck()
        }
    }
    @Published var postText = "" {
        didSet {
            allEnteredCheck()
        }
    }
    @Published var workingHoursText = "" {
        didSet {
            allEnteredCheck()
        }
    }
    
    var disabled: Bool = true
    
    init(employeesData: EmployeesData) {
        self.employeesData = employeesData
    }
    
    func addButtonPressed() {
        employeesData.setEmployee(Employee(employeeName: nameText, position: postText, workingHours: workingHoursText))
    }
    
    private func allEnteredCheck() {
        var disabled = false
        if nameText == "" || postText == "" || workingHoursText == "" {
            disabled = true
        }
        self.disabled = disabled
    }
}
