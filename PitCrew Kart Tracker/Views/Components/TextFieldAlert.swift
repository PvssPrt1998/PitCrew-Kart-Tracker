

import SwiftUI

struct TextFieldAlert: View {
    
    @Binding var text: String
    let action: () -> Void

    var body: some View {
        VStack(spacing: 16) {
            TextCustom(text: "Total cost of repairs", size: 17, weight: .semibold, color: .white)
            TextField("", text: $text)
                .fontCustom(size: 17, weight: .regular, color: .textTertiary)
                .autocorrectionDisabled(true)
                .keyboardType(.numberPad)
                .onChange(of: text) { newValue in
                    let filtered = newValue.filter { Set("0123456789").contains($0) }
                    if filtered != "" {
                        text = filtered
                    } else {
                        text = ""
                    }
                }
                .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
                .background(
                    placeholderView()
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(.specialSeparator, lineWidth: 0.5)
                )
                .padding(.horizontal, 16)
            VStack(spacing: 0) {
                Divider().overlay(Color.totalCostDivider)
                Button {
                    action()
                } label: {
                    TextCustom(text: "Add", size: 17, weight: .semibold, color: isButtonActive() ? .appSecondary : .textTertiary)
                        .frame(width: 270, height: 44)
                }
                .disabled(!isButtonActive())
            }
        }
        .padding(.top, 21)
        .frame(maxWidth: 270)
        .background(Color.totalCostAlertBackground)
        .clipShape(.rect(cornerRadius: 14))
    }
    
    func isButtonActive() -> Bool {
        text == "" ? false : true
    }
    
    @ViewBuilder func placeholderView() -> some View {
        Text(text != "" ? "" : "Enter cost")
            .fontCustom(size: 15, weight: .regular, color: .specialPlaceholder)
            .padding(EdgeInsets(top: 2, leading: 6, bottom: 2, trailing: 6))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
