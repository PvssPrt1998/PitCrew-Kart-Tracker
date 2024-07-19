
import SwiftUI
import Combine

struct KartAddView: View {
    
    @ObservedObject var viewModel: KartAddViewModel
    
    @EnvironmentObject var showSheet: HomeView.ShowSheetWrapper
    
    var body: some View {
        SheetBackgroundContainerView(title: "New go-kart") {
            VStack(spacing: 20) {
                AddItemImage(imageData: $viewModel.imageData)
                
                TextFieldCustom(text: $viewModel.nameText, placeholder: "Enter name")
                    .keyboardType(.default)
                    .onTapGesture {}
                TextFieldCustom(text: $viewModel.quantityText, placeholder: "Enter quantity")
                    .keyboardType(.numberPad)
                    .onReceive(Just(viewModel.quantityText)) { newValue in
                        let filtered = newValue.filter { Set("0123456789").contains($0) }
                        if filtered != newValue {
                            self.viewModel.quantityText = filtered
                        }
                    }
                    .onTapGesture {}
                TextFieldCustom(text: $viewModel.speedText, placeholder: "Enter maximum speed")
                    .keyboardType(.numberPad)
                    .onChange(of: viewModel.speedText, perform: { newValue in
                        speedValidation(newValue)
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
    
    private func quantityValidation(_ newValue: String) {
        let filtered = newValue.filter { Set("0123456789").contains($0) }
        if filtered != newValue {
            self.viewModel.quantityText = filtered
        }
    }
    
    private func speedValidation(_ newValue: String) {
        var filtered = newValue.filter { Set("0123456789").contains($0) }
        let newValuePostfixFilter = newValue.filter{ Set(" km/h.").contains($0) }
        if newValuePostfixFilter != "" && !newValue.contains(" km/h.") {
            filtered.removeLast()
        }
        if filtered != "" {
            viewModel.speedText = filtered + " km/h."
        } else {
            viewModel.speedText = ""
        }
    }
}
