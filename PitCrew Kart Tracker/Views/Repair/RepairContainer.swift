

import SwiftUI

final class RepairContainer {
    
    let repairViewModelFactory: RepairViewModelFactory
    
    init(_ repairViewModelFactory: RepairViewModelFactory) {
        self.repairViewModelFactory = repairViewModelFactory
    }
    
    @ViewBuilder func repairView() -> some View {
        RepairView(container: self, viewModel: repairViewModelFactory.makeRepairViewModel())
    }
    
    @ViewBuilder func repairTableView() -> some View {
        RepairTableView(viewModel: repairViewModelFactory.makrRepairTableViewModel())
    }
    
    @ViewBuilder func repairAddView() -> some View {
        RepairAddView(viewModel: repairViewModelFactory.makeRepairAddViewModel())
    }
}
