

import SwiftUI

struct RepairAddView: View {
    
    @ObservedObject var viewModel: RepairAddViewModel
    
    @EnvironmentObject var showSheet: RepairView.ShowSheetWrapper

    var body: some View {
        SheetBackgroundContainerView(title: "New info Repair") {
            VStack(spacing: 20) {
                TextFieldCustom(text: $viewModel.nameText, placeholder: "Enter name")
                    .onTapGesture {}
                TextFieldCustom(text: $viewModel.costText, placeholder: "Enter cost")
                    .keyboardType(.numberPad)
                    .onChange(of: viewModel.costText, perform: { newValue in
                        costValidation(newValue)
                    })
                    .onTapGesture {}
                AddItemViewButton(title: "Add", disabled: viewModel.disabled) {
                    viewModel.addButtonPressed()
                    showSheet.showSheet = false
                }
            }.frame(maxHeight: .infinity, alignment: .top)
        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
    }
    
    private func costValidation(_ newValue: String) {
        let filtered = newValue.filter { Set("0123456789").contains($0) }
        
        if filtered != "" {
            viewModel.costText = "$" + filtered
        } else {
            viewModel.costText = ""
        }
    }
}

struct RepairAddView_Preview: PreviewProvider {
    
    static var previews: some View {
        RepairAddView(viewModel: RepairAddViewModel(repairData: RepairData(dataManager: DataManager())))
    }
}
