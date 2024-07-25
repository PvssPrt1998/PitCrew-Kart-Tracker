
import SwiftUI

struct HomeView: View {
    
    weak var container: HomeContainer?
    
    class ShowSheetWrapper: ObservableObject {
        @Published var showSheet = false
        @Published var showKartingPlaceSheet = false
    }
    
    @StateObject var showSheetWrapper = ShowSheetWrapper()
    
    var body: some View {
        ZStack {
            Color.bgSecond.ignoresSafeArea()
            container?.kartingPlaceContainerView()
            container?.buildKartsView()
            Divider().frame(maxHeight: .infinity, alignment: .bottom)
        }
        .sheet(isPresented: $showSheetWrapper.showSheet) {
            container?.buildKartAddView()
        }
        .sheet(isPresented: $showSheetWrapper.showKartingPlaceSheet) {
            container?.kartingPlaceAddView()
        }
        .environmentObject(showSheetWrapper)
    }
}
