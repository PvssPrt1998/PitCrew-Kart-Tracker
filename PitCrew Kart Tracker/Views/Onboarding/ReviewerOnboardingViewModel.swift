

import SwiftUI
import Combine

final class ReviewerOnboardingViewModel: ObservableObject {
    
    let toNext = PassthroughSubject<Bool, Never>()
    
    struct OnboardingData {
        let title: String
        let caption: String
        let backgroundTitle: String
    }
    
    @Published var selection: Int = 0
    
    let items = [
        OnboardingData(title: "Your go-kart fleet", caption: "All go-kart cars in one place", backgroundTitle: ImageTitles.ReviewerOnboardingBackground1.rawValue),
        OnboardingData(title: "Employees are under \ncontrol", caption: "Make important changes quickly", backgroundTitle: ImageTitles.ReviewerOnboardingBackground2.rawValue),
        OnboardingData(title: "Write down the repair \ncosts", caption: "Control all expenses in the app", backgroundTitle: ImageTitles.ReviewerOnboardingBackground3.rawValue)
    ]
    
    var itemsRange: Range<Int> {
        0..<items.count
    }
    
    func nextButtonPressed() {
        if selection < items.count - 1 {
            selection += 1
        } else {
            toNext.send(true)
        }
    }
    
    func colorByIndex(_ index: Int) -> Color {
        selection == index ? .appSecondary : .secondaryDisabled
    }
    
    func widthByIndex(_ index: Int) -> CGFloat {
        selection == index ? 25 : 8
    }
}
