
import SwiftUI

struct EmptyKartingPlaceView: View {
    
    @EnvironmentObject var showSheet: HomeView.ShowSheetWrapper
    
    var body: some View {
        AddView(title: "Add the data", description: "Indicate basic information", buttonTitle: "Add information", showBackground: true) {
            showSheet.showKartingPlaceSheet = true
        }
        .frame(height: 320)
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea(.container, edges: .vertical)
    }
}

struct EmptyKartingPlaceView_Preview: PreviewProvider {
    
    static var previews: some View {
        EmptyKartingPlaceView()
    }
}
