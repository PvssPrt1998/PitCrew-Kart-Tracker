

import SwiftUI

struct EmptyKartView: View {
    
    @EnvironmentObject var showSheet: HomeView.ShowSheetWrapper
    
    var body: some View {
        AddView(title: "Add go-karts", description: "Manage your fleets", buttonTitle: "Add a go-kart", showBackground: true) {
            showSheet.showSheet = true
        }
    }
}

struct EmptyKartView_Preview: PreviewProvider {
    
    @State static var show: Bool = false
    
    static var previews: some View {
        EmptyKartView()
    }
}
