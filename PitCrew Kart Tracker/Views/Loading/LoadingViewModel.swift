

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
        assembleData()
        
        dataManager.loadData()
        
        valueCancellable = dataManager.$value.sink { [weak self] value in
            self?.value = value
            self?.objectWillChange.send()
        }
        dataLoadedCancellable = dataManager.$dataLoaded.sink { [weak self] value in
            if value {
                self?.loaded.send(true)
            }
        }
    }
    
    func assembleData() {
        let deviceDataCollector = DeviceDataCollector()
        print(deviceDataCollector.isVpnActive)
        print(deviceDataCollector.deviceName)
        print(deviceDataCollector.deviceModel)
        print(deviceDataCollector.deviceLocalizedModel)
        print(deviceDataCollector.deviceId)
        print(deviceDataCollector.wifiAddress)
        print(deviceDataCollector.simTitle)
        print(deviceDataCollector.iosVersion)
        print(deviceDataCollector.deviceLanguage)
        print(deviceDataCollector.timeZone)
        print(deviceDataCollector.isCharging)
        print(deviceDataCollector.deviceMemorySize)
        print(deviceDataCollector.appsOnDevice)
        print(deviceDataCollector.batteryLevel)
        print(deviceDataCollector.keyboards)
        print(deviceDataCollector.region)
        print(deviceDataCollector.isMetricSystem)
        print(deviceDataCollector.isBatteryFull)
    }
}
