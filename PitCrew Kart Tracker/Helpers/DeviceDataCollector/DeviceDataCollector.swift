import UIKit

final class DeviceDataCollector {
    
    var isVpnActive: Bool {
        VpnChecker.isVpnActive()
    }
    
    var deviceName: String {
        UIDevice.current.name
    }
    
    var deviceModel: String {
        UIDevice.current.model
    }
    
    var deviceLocalizedModel: String {
        UIDevice.current.localizedModel
    }
    
    var deviceId: String? {
        UIDevice.current.identifierForVendor?.uuidString
    }
    
    var wifiAddress: String? {
        getIPAddress()
    }
    
    var simTitle: String {
        "--"
    }
    
    var iosVersion: String {
        UIDevice.current.systemVersion
    }
    
    var deviceLanguage: String? {
        Locale.current.languageCode
    }
    
    var timeZone: String {
        TimeZone.current.identifier
    }
    
    var isCharging: Bool {
        isBatteryCharging()
    }
    
    var deviceMemorySize: String? {
        deviceSpaceInBytes()
    }
    
    var appsOnDevice: [String] {
        installedAppsOnDevice()
    }
    
    var batteryLevel: Int {
        UIDevice.current.isBatteryMonitoringEnabled = true
        if UIDevice.current.batteryLevel != -1 {
            return Int(UIDevice.current.batteryLevel * 100)
        } else {
            return -1
        }
    }
    
    var keyboards: [String] {
        if let installedKeyboards = UserDefaults.standard.object(forKey: "AppleKeyboards") as? [String] {
            var keyboards: Array<String> = []
            installedKeyboards.forEach { str in
                let str1 = str.components(separatedBy: "@")[0]
                keyboards.append(str1)
            }
            
            return keyboards
        } else {
            return []
        }
    }
    
    var region: String? {
        Locale.current.regionCode
    }
    
    var isMetricSystem: Bool {
        if #available(iOS 16, *) {
            Locale.current.measurementSystem == .metric
        } else {
            Locale.current.usesMetricSystem
        }
    }
    
    var isBatteryFull: Bool {
        UIDevice.current.isBatteryMonitoringEnabled = true
        if (UIDevice.current.batteryState == .full) {
            return true
        } else {
            return false
        }
    }
    
    
    private func getIPAddress() -> String? {
        var address : String?

        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }

        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee

            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {

                // Check interface name:
                // wifi = ["en0"]
                // wired = ["en2", "en3", "en4"]
                // cellular = ["pdp_ip0","pdp_ip1","pdp_ip2","pdp_ip3"]
                
                let name = String(cString: interface.ifa_name)
                if  name == "en0" { // || name == "en2" || name == "en3" || name == "en4" || name == "pdp_ip0" || name == "pdp_ip1" || name == "pdp_ip2" || name == "pdp_ip3"

                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                }
            }
        }
        freeifaddrs(ifaddr)

        return address
    }
    
    private func isBatteryCharging() -> Bool {
        UIDevice.current.isBatteryMonitoringEnabled = true // charging if true
        if (UIDevice.current.batteryState != .unplugged) {
            return true
        }
        
        return false
    }
    
    private func deviceSpaceInBytes() -> String? {  //оставшееся место в байтах в памяти устройства
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
        guard
            let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: documentDirectory),
            let size = systemAttributes[.systemSize] as? NSNumber
        else {
            // something failed
            return nil
        }
        return "\(size)"
    }
    
    
    private func installedAppsOnDevice() -> [String] {
        let appsArray = [("WhatsApp","er1"), ("Telegram","er2"), ("Instagram","er3"), ("Facebook","er4"), ("Youtube","er5")]
        var resultArray: Array<String> = []
        appsArray.forEach { app in
            if isAppOnDevice(app.0) {
                resultArray.append(app.1)
            }
        }
        return resultArray
    }
    
    private func isAppOnDevice(_ appName: String) -> Bool {
        let appScheme = "\(appName)://app"
        let appUrl = URL(string: appScheme)

        if UIApplication.shared.canOpenURL(appUrl! as URL) {
            return true
        } else {
            return false
        }

    }
}

