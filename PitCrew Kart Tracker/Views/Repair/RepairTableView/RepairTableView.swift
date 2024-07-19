

import SwiftUI

struct RepairTableView: View {
    
    @ObservedObject var viewModel: RepairTableViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(0..<viewModel.repairsCount, id: \.self) { index in
                    VStack(spacing: 0) {
                        RepairTableViewCell(repair: viewModel.getRepair(by: index), max: viewModel.max)
                            .cornerRadius(12, firstOrLastElement: firstOrLast(index: index))
                        if index != viewModel.repairsCount - 1 && viewModel.repairsCount - 1 != 0 {
                            Divider()
                                .overlay(Color.bgLight)
                                .padding(.leading, 16)
                        }
                    }
                }
            }
        }
        .clipShape(.rect(cornerRadius: 12))
    }
    
    private func firstOrLast(index: Int) -> Bool? {
        if index == 0 {
            if viewModel.repairsCount - 1 == 0 {
                return nil
            }
            return true
        } else if index == viewModel.repairsCount - 1 {
            return false
        }
        return nil
    }
}

#Preview {
    RepairTableView(viewModel: RepairTableViewModel(repairData: RepairData(dataManager: DataManager())))
        .padding(10)
        .background(Color.bgSecond)
}
