

import SwiftUI

struct TextCustom: View {
    
    let text: String
    let size: CGFloat
    let weight: UIFont.Weight
    let color: Color?
    var design: UIFontDescriptor.SystemDesign? = nil
    
    var body: some View {
        Text(text)
            .font(Font(UIFont.fontWith(size: size, weight: weight, design: design)))
            .foregroundColorCustom(color != nil ? color! : Color.black)
            
    }
}

#Preview {
    TextCustom(text: "123", size: 34, weight: .bold, color: .yellow)
}
