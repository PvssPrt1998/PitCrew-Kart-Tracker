

import SwiftUI

final class MainContainer {
    
    let homeContainer: HomeContainer
    let employeesContainer: EmployeesContainer
    let repairContainer: RepairContainer
    
    init(_ viewModelFactory: ViewModelFactory) {
        homeContainer = HomeContainer(viewModelFactory.kartsViewModelFactory)
        employeesContainer = EmployeesContainer(viewModelFactory.employeeViewModelFactory)
        repairContainer = RepairContainer(viewModelFactory.repairsViewModelFactory)
    }
    
    func mainView() -> some View {
        MainView(self)
    }
    
    func homeView() -> some View {
        homeContainer.homeView()
    }
    
    func employeesView() -> some View {
        employeesContainer.employeesView()
    }
    
    func repairView() -> some View {
        repairContainer.repairView()
    }
    
    func settingsView() -> some View {
        SettingsView()
    }
}

