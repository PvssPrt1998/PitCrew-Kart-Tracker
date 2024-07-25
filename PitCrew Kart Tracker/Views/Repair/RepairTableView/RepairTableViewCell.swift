
import SwiftUI

struct RepairTableViewCell: View {
    
    let repair: Repair
    let max: Int
    
    @State var centerOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            TextCustom(text: repair.title, size: 16, weight: .regular, color: .textMain)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                ZStack {
                    TextCustom(text: "$\(max)", size: 17, weight: .semibold, color: .textMain)
                        .multilineTextAlignment(.center)
                        .hidden()
                    TextCustom(text: "$\(repair.cost)", size: 17, weight: .semibold, color: .textMain)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
        }
        .padding(EdgeInsets(top: 19, leading: 16, bottom: 19, trailing: 0))
        .background(Color.bgLight)
    }
}

#Preview {
    VStack(spacing: 0) {
        RepairTableViewCell(repair: Repair(title: "repair10000", cost: 1000000), max: 1000000)
        RepairTableViewCell(repair: Repair(title: "repair2", cost: 200), max: 1000000)
    }
        .padding(20)
        .background(Color.bgSecond)
}
