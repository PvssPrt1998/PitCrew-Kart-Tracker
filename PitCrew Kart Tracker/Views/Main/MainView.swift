import SwiftUI

struct MainView: View {

    weak var mainViewContainer: MainContainer?
    
    init(_ mainViewContainer: MainContainer? = nil) {
        self.mainViewContainer = mainViewContainer
        
        let appearance = UITabBarAppearance()
        
        appearance.configureWithTransparentBackground()
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(rgbColorCodeRed: 244, green: 248, blue: 255, alpha: 0.5)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(rgbColorCodeRed: 244, green: 248, blue: 255, alpha: 0.5)]

        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(rgbColorCodeRed: 102, green: 172, blue: 255, alpha: 1)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(rgbColorCodeRed: 102, green: 172, blue: 255, alpha: 1)]
        
        appearance.shadowColor = .white.withAlphaComponent(0.15)
        appearance.shadowImage = UIImage(named: "tab-shadow")?.withRenderingMode(.alwaysTemplate)
        UITabBar.appearance().standardAppearance = appearance
    }
    
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            mainViewContainer?.homeView()
                .tabItem {
                    ItemMainView(imageTitle: ImageTitles.tabItemHouse.rawValue, text: "Home")
                }
                .tag(1)
            mainViewContainer?.employeesView()
                .tabItem {
                    ItemMainView(imageTitle: ImageTitles.tabItemPerson.rawValue, text: "Employees")
                }
                .tag(2)
            mainViewContainer?.repairView()
                .tabItem {
                    ItemMainView(imageTitle: ImageTitles.tabItemWrench.rawValue, text: "Repair")
                }
                .tag(3)
            mainViewContainer?.settingsView()
                .tabItem {
                    ItemMainView(imageTitle: ImageTitles.tabItemGear.rawValue, text: "Settings")
                }
                .tag(4)
        }
    }
}

#Preview {
    MainView()
}



