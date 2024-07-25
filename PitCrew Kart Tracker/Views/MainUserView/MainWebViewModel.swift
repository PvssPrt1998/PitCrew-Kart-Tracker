
import Foundation
import Combine
import UIKit

final class MainUserViewModel: ObservableObject {
    
    var dataManager: DataManager
    
    private var orientationCancellable: AnyCancellable?
    
    var url: String {
        dataManager.urlForWebView
    }
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
    }
}
