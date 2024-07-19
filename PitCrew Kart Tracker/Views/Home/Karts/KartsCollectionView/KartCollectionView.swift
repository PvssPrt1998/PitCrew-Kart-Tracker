import SwiftUI

struct KartCollectionView: View {

    @ObservedObject var viewModel: KartCollectionViewModel
    
    @EnvironmentObject var showSheet: HomeView.ShowSheetWrapper
    
    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 0)], alignment: .center, spacing: 12) {
                    ForEach(0..<viewModel.kartsCount, id: \.self) { index in
                        KartCollectionViewCell(kart: viewModel.getKart(by: index))
                    }
                }
            }
            .cornerRadius(12, corners: [.topLeft, .topRight])
            
            AddItemViewButton(title: "Add a go-kart", disabled: false) {
                showSheet.showSheet = true
            }
            .frame(width: 286)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .padding(.bottom, 16)
           
        }
    }
}

struct KartCollectionView_Preview: PreviewProvider {
    static var previews: some View {
        KartCollectionView(viewModel: KartCollectionViewModel(kartData: KartData(dataManager: DataManager())))
            .background(Color.bgMain)
    }
}
