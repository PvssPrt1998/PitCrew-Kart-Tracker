
import SwiftUI

struct KartingPlaceAddView: View {
    
    @ObservedObject var viewModel: KartingPlaceAddViewModel
    
    @EnvironmentObject var showSheet: HomeView.ShowSheetWrapper
    
    var body: some View {
        SheetBackgroundContainerView(title: "Edit basic information") {
            VStack(spacing: 20) {
                AddItemImage(imageData: $viewModel.imageData)
                TextFieldCustom(text: $viewModel.nameText, placeholder: "Enter name")
                    .onTapGesture {}
                TextFieldCustom(text: $viewModel.addressText, placeholder: "Enter address")
                    .onTapGesture {}
                AddItemViewButton(title: "Add", disabled: viewModel.disabled) {
                    viewModel.saveButtonPressed()
                    showSheet.showKartingPlaceSheet = false
                }
            }.frame(maxHeight: .infinity, alignment: .top)
        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
        }
    }
}
