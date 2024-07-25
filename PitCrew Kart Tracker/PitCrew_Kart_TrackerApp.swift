import SwiftUI

@main
struct PitCrew_Kart_TrackerApp: App {
    @ObservedObject var appCoordinator: AppCoordinator
    
    init() {
        let appContainer = AppContainer()
        self.appCoordinator = AppCoordinator(appContainer: appContainer)
    }
    
    @State var ispres = true
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.build()
                .preferredColorScheme(.dark)
        }
    }
}
