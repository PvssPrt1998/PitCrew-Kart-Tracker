

import SwiftUI

struct RepairTotalCostView: View {
    
    let value: Int
    let action: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                VStack(spacing: 10) {
                    TextCustom(text: "$\(value)", size: 28, weight: .bold, color: .white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                
                    TextCustom(text: "Total cost of repairs", size: 15, weight: .regular, color: .textNotActive)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                Button {
                    action()
                } label: {
                    Image(systemName: "pencil")
                        .fontCustom(size: 27, weight: .bold, color: .white)
                }
                .frame(width: 32, height: 32)
            }
        }
        .padding(EdgeInsets(top: 25, leading: 10, bottom: 25, trailing: 30))
        .background(Color.bgMain)
        .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    RepairTotalCostView(value: 24124241, action: {})
        .padding(20)
}
