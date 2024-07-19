

import SwiftUI

struct KartingPlaceContainerView: View {
    
    weak var container: HomeContainer?
    
    @ObservedObject var viewModel: KartingPlaceContainerViewModel
    
    init(_ container: HomeContainer, viewModel: KartingPlaceContainerViewModel) {
        self.container = container
        self.viewModel = viewModel
    }
    
    var body: some View {
        kartingPlaceContainerView()
    }
    
    @ViewBuilder func kartingPlaceContainerView() -> some View {
        if viewModel.isKartingPlaceExists {
            container?.kartingPlaceView()
        } else {
            EmptyKartingPlaceView()
        }
    }
}
