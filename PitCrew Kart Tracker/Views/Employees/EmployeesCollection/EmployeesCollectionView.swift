

import SwiftUI

struct EmployeesCollectionView: View {
    
    @ObservedObject var viewModel: EmployeesCollectionViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 0)], alignment: .center, spacing: 12) {
                ForEach(0..<viewModel.employeesCount, id: \.self) { index in
                    EmployeeCollectionViewCell(employee: viewModel.getEmployee(by: index))
                }
            }
        }
    }
}

#Preview {
    EmployeesCollectionView(viewModel: EmployeesCollectionViewModel(employeesData: EmployeesData(dataManager: DataManager())))
        .background(Color.bgSecond)
}
