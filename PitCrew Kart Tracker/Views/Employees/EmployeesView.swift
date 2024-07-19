

import SwiftUI

struct EmployeesView: View {
    
    weak var container: EmployeesContainer?
    
    @ObservedObject var viewModel: EmployeesViewModel

    class ShowSheetWrapper: ObservableObject {
        @Published var showSheet = false
    }
    
    @StateObject var showSheetWrapper = ShowSheetWrapper()
    
    var body: some View {
        ZStack {
            BackgroundContainerView(title: "Employee") {
                employeeView()
                    .sheet(isPresented: $showSheetWrapper.showSheet, content: {
                        container?.employeeAddView()
                    })
                    .environmentObject(showSheetWrapper)
            }
            Divider().frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    @ViewBuilder private func employeeView() -> some View {
        if viewModel.employeesExists {
            ZStack {
                container?.employeesCollectionView()
                AddItemViewButton(title: "Add employee", disabled: false) {
                    showSheetWrapper.showSheet = true
                }
                .frame(width: 286)
                .padding(.bottom, 16)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
        } else {
            EmployeesEmptyView()
        }
    }
}

#Preview {
    EmployeesView(viewModel: EmployeesViewModel(employeesData: EmployeesData(dataManager: DataManager())))
}

