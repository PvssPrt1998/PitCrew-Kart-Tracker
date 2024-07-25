
import SwiftUI

struct NextButton: View {
    
    var title: String? = nil
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            TextCustom(text: title ?? "Next", size: 14, weight: .bold, color: .white)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(width: 160, height: 45)
        .background(Color.appPrimary)
        .clipShape(.rect(cornerRadius: 18))
    }
}

#Preview {
    NextButton(action: {})
        .frame(width: 160, height: 45)
}
