

import SwiftUI

struct RepairView: View {
    
    weak var container: RepairContainer?
    
    @ObservedObject var viewModel: RepairViewModel
    
    class ShowSheetWrapper: ObservableObject {
        @Published var showSheet = false
    }
    
    @State var showRepairTotalCostAlert = false
    
    @StateObject var showSheetWrapper = ShowSheetWrapper()
    
    var body: some View {
        ZStack {
            BackgroundContainerView {
                VStack(spacing: spacingDevice()) {
                    RepairTotalCostView(value: viewModel.totalCost) {
                        showRepairTotalCostAlert = true
                    }
                    VStack(spacing: 10) {
                        TextCustom(text: "Repair", size: 20, weight: .semibold, color: .textFieldText)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        repairTableView()
                    }
                }
                .sheet(isPresented: $showSheetWrapper.showSheet, content: {
                    container?.repairAddView()
                })
                .environmentObject(showSheetWrapper)
            }
            if showRepairTotalCostAlert {
                ZStack {
                    Color.black.opacity(0.35).ignoresSafeArea()
                    TextFieldAlert(text: $viewModel.totalCostText) {
                        viewModel.setTotalCost()
                        showRepairTotalCostAlert = false
                    }
                }
            }
            Divider().frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
    
    func spacingDevice() -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return 50
        }
        return 20
    }
    
    @ViewBuilder private func repairTableView() -> some View {
        if viewModel.repairsExists {
            ZStack {
                container?.repairTableView()
                AddItemViewButton(title: "Add info Repair", disabled: false) {
                    showSheetWrapper.showSheet = true
                }
                .frame(width: 286)
                .padding(.bottom, 16)
                .frame(maxHeight: .infinity, alignment: .bottom)
            }
            
        } else {
            RepairEmptyView()
        }
    }
}

#Preview {
    RepairContainer(RepairViewModelFactory(repairData: RepairData(dataManager: DataManager()))).repairView()
}
