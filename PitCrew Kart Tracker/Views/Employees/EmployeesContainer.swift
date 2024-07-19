

import SwiftUI

final class EmployeesContainer {
    
    let employeeViewModelFactory: EmployeeViewModelFactory
    
    init(_ employeeViewModelFactory: EmployeeViewModelFactory) {
        self.employeeViewModelFactory = employeeViewModelFactory
    }
    
    @ViewBuilder func employeesView() -> some View {
        EmployeesView(container: self, viewModel: employeeViewModelFactory.makeEmployeesViewModel())
    }
    
    @ViewBuilder func employeesCollectionView() -> some View {
        EmployeesCollectionView(viewModel: employeeViewModelFactory.makeEmployeesCollectionViewModel())
    }
    
    @ViewBuilder func employeeAddView() -> some View {
        EmployeeAddView(viewModel: employeeViewModelFactory.makeEmployeeAddViewModel())
    }
}
