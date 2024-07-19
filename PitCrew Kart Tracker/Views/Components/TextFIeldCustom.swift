import SwiftUI

struct TextFieldCustom: View {
    
    @Binding var text: String

    var placeholder: String
    
    var body: some View {
       TextField("", text: $text)
            .fontCustom(size: 15, weight: .regular, color: .textFieldText)
            .autocorrectionDisabled(true)
            .padding(EdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 0))
            .background(
                placeholderView()
            )
            .background(Color.bgLight)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.specialSeparator, lineWidth: 0.5)
            )
            .clipShape(.rect(cornerRadius: 12))
            .frame(height: 45)
    }
    
    @ViewBuilder func placeholderView() -> some View {
        Text(text != "" ? "" : placeholder)
            .fontCustom(size: 15, weight: .regular, color: .specialPlaceholder)
            .padding(EdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 0))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TextFieldCustom_Preview: PreviewProvider {
    
    @State static var text: String = ""
    
    static var previews: some View {
        TextFieldCustom(text: $text, placeholder: "Placeholder")
            .padding(20)
            .background(Color.bgMain)
    }
}
