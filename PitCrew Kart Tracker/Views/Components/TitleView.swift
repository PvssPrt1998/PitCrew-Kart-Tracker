

import SwiftUI

struct TitleView: View {
    
    enum TitlePlacement {
        case leading
        case center
    }
    
    let text: String
    let titlePlacement: TitlePlacement
    
    var isCenter: Bool {
        titlePlacement == .center ? true : false
    }
    
    var size: CGFloat {
        isCenter ? 17 : 34
    }
    
    var weight: UIFont.Weight {
        isCenter ? .semibold : .bold
    }
    
    var body: some View {
        HStack {
            if isCenter { Spacer() }
            TextCustom(text: text, size: size , weight: weight, color: .white)
            Spacer()
        }
    }
}

#Preview {
    TitleView(text: "Employee", titlePlacement: .leading)
}
