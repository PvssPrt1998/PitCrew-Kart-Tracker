import Foundation
import Combine

final class LoadingViewModel: ObservableObject {
    
    let loaded = PassthroughSubject<Bool, Never>()
    
    let dataManager: DataManager
    
    private var valueCancellable: AnyCancellable?
    private var dataLoadedCancellable: AnyCancellable?
    
    var value: Double = 0
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        dataManager.loadLocalData()
        
        valueCancellable = dataManager.$value.sink { [weak self] value in
            self?.value = value
            self?.objectWillChange.send()
        }
        dataLoadedCancellable = dataManager.$dataLoaded.sink { [weak self] value in
            if value { //Если локальные данные готовы и выбран тип приложения
                if dataManager.appType == .karting { // true webView flow, false defaultApp
                    self?.loaded.send(false)
                } else {
                    self?.loaded.send(true)
                }
            }
        }
    }
    
    func setRecorded() {
        dataManager.recorded = true
    }
    
    func setScreenshotTaken() {
        dataManager.screenshotTaken = true
    }
    
    func checkAppType() {
        dataManager.setupWebViewCondition()
    }
}
