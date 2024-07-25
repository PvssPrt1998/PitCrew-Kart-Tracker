
import SwiftUI
import StoreKit

struct SettingsButton: View {
    
    let title: String
    let buttonImageTitle: String
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack(spacing: 5) {
                Image(systemName: buttonImageTitle)
                    .fontCustom(size: 20, weight: .semibold, color: .textFieldText)
                TextCustom(text: title, size: 15, weight: .medium, color: .textFieldText)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(EdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16))
            .frame(height: 100)
            .background(Color.bgLight)
            .clipShape(.rect(cornerRadius: 10))
        }
    }
}

#Preview {
    SettingsButton(title: "Rate App", buttonImageTitle: "star.leadinghalf.filled") {
        
    }
    .padding()
    .background(Color.bgSecond)
}
