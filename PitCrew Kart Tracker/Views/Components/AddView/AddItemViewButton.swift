import SwiftUI

struct AddItemViewButton: View {
    
    let title: String
    var disabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            TextCustom(text: title, size: 17, weight: .regular, color: disabled ? Color.textNotActive : Color.white)
                .padding(EdgeInsets(top: 14, leading: 20, bottom: 14, trailing: 20))
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .disabled(disabled)
        .background(disabled ? Color.textNotActive :Color.appPrimary)
        .clipShape(.rect(cornerRadius: 12))
    }
}
