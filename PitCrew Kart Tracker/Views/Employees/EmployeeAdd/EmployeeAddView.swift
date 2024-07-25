
import SwiftUI

struct EmployeeAddView: View {
    
    @ObservedObject var viewModel: EmployeeAddViewModel
    
    @EnvironmentObject var showSheet: EmployeesView.ShowSheetWrapper
    
    var body: some View {
        SheetBackgroundContainerView(title: "New employee") {
            VStack(spacing: 20) {
                TextFieldCustom(text: $viewModel.nameText, placeholder: "Enter name")
                    .onTapGesture {}
                TextFieldCustom(text: $viewModel.postText, placeholder: "Enter post")
                    .onTapGesture {}
                TextFieldCustom(text: $viewModel.workingHoursText, placeholder: "Enter working hours")
                    .keyboardType(.numberPad)
                    .onChange(of: viewModel.workingHoursText, perform: { newValue in
                        workingHoursValidation(newValue)
                    })
                    .onTapGesture {}
                AddItemViewButton(title: "Add", disabled: viewModel.disabled) {
                    viewModel.addButtonPressed()
                    showSheet.showSheet = false
                }
                .onTapGesture {}
            }.frame(maxHeight: .infinity, alignment: .top)
        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
    }
    
    private func workingHoursValidation(_ newValue: String) {
        let filtered = newValue.filter { Set("0123456789").contains($0) }
        
        if filtered != "" {
            var filterIterable = filtered.makeIterator()
            var index = 0
            var value = ""
            while let c = filterIterable.next() {
                if index == 0 || index == 1 || index == 3 || index == 5 || index == 7 {
                    value = value + "\(c)"
                }
                if index == 2 || index == 6 {
                    value = value + ":\(c)"
                }
                if index == 4 {
                    value = value + " - \(c)"
                }
                index += 1
            }
            viewModel.workingHoursText = value
        } else  {
            viewModel.workingHoursText = ""
        }
    }
}

struct EmployeeAddView_Preview: PreviewProvider {
    
    static var previews: some View {
        EmployeeAddView(viewModel: EmployeeAddViewModel(employeesData: EmployeesData(dataManager: DataManager())))
    }
}
