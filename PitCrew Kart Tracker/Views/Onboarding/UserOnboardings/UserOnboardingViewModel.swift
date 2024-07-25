import SwiftUI
import Combine
import StoreKit

final class UserOnboardingViewModel: ObservableObject {
    
    let toNext = PassthroughSubject<Bool, Never>()
    
    struct OnboardingData {
        let title: String
        let caption: String
        let backgroundTitle: String
    }
    
    @Published var selection: Int = 0
    
    var itemsRange: Range<Int> {
        0..<items.count
    }
    
    var indicatorElementsCount: Int {
        items.count - 1
    }

    let items = [OnboardingData(title: "Employees are under control", caption: "Place a bet on yourself", backgroundTitle: ImageTitles.UserOnboardingBackground1.rawValue),
                 OnboardingData(title: "Rate our app in the AppStore", caption: "Help make the app even better", backgroundTitle: ImageTitles.UserOnboardingBackground2.rawValue),
                 OnboardingData(title: "Don’t miss anything", caption: "Don’t miss the most useful information", backgroundTitle: ImageTitles.PushActivationScreenBackground.rawValue)
    ]
    
    func selectionNext() {
        if selection < items.count - 1 {
            selection += 1
            if selection == 1 {
                SKStoreReviewController.requestReviewInCurrentScene()
            }
        } else {
            toNext.send(true)
        }
    }
    
    func closeButton() {
        toNext.send(true)
    }
    
    func colorByIndex(_ index: Int) -> Color {
        selection == index ? Color.appSecondary : .secondaryDisabled
    }
    
    func widthByIndex(_ index: Int) -> CGFloat {
        if selection == index || selection == 2 && index == 1{
            return 25
        } else {
            return 8
        }
    }
}
