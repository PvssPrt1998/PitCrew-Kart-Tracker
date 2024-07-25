
import SwiftUI

struct EmployeesEmptyView: View {
    
    @EnvironmentObject var showSheet: EmployeesView.ShowSheetWrapper
    
    var body: some View {
        AddView(title: "Add your employees", description: "fill in the information", buttonTitle: "Add employee", showBackground: true) {
            showSheet.showSheet = true
        }
        .frame(maxHeight: .infinity, alignment: .center)
    }
}

struct EmployeesEmptyView_Preview: PreviewProvider {
    
    static var previews: some View {
        EmployeesEmptyView()
    }
}
