
import Foundation

final class MainUserViewModel: ObservableObject {
    
    private var dataManager: DataManager
    
    var url: String {
        dataManager.urlForWebView
    }
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
}
