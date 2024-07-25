
import SwiftUI

struct RepairEmptyView: View {
    
    @EnvironmentObject var showSheet: RepairView.ShowSheetWrapper
    
    var body: some View {
        AddView(title: "Add info Repair", description: "Fill out the repair expenses", buttonTitle: "Add info", showBackground: true) {
            showSheet.showSheet = true
        }
        .frame(maxHeight: .infinity, alignment: .center)
    }
}

struct RepairEmptyView_Preview: PreviewProvider {
    
    static var previews: some View {
        RepairEmptyView()
    }
}
