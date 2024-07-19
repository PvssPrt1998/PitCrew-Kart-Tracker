import SwiftUI

class SheetSizeManager: ObservableObject {
    
    enum SizeState: CGFloat {
        case defalt = 297
        case large = 70
    }
    
    @Published var topPadding: CGFloat = 297
    
    var sizeState: SizeState
    var fixedStateValue: CGFloat
    
    let dragGesture: DragGesture
    
    init(sizeState: SizeState) {
        self.sizeState = sizeState
        self.fixedStateValue = sizeState.rawValue
        
        self.dragGesture = DragGesture()
    }
    
    func dragGestureOnChanged(_ value: DragGesture.Value) {
        if isGestureValueInBounds(value.translation.height) {
            calcPadding(value.translation.height, ended: false)
        } else {
            setState(value.translation.height)
            calcPadding(0, ended: true)
        }
    }
    
    func dragGestureOnEnded(_ value: DragGesture.Value) {
        let velocity = CGSize(
            width:  value.predictedEndLocation.x - value.location.x,
            height: value.predictedEndLocation.y - value.location.y
        )
        setState(value.translation.height + velocity.height)
        withAnimation {
            calcPadding(0, ended: true)
        }
    }
    
    func setState(_ value: CGFloat) {
        if fixedStateValue + value > (297/2) {
            sizeState = .defalt
            fixedStateValue = sizeState.rawValue
        } else {
            sizeState = .large
            fixedStateValue = sizeState.rawValue
        }
    }
    
    func isGestureValueInBounds(_ value: CGFloat) -> Bool {
        if  (fixedStateValue + value) > SizeState.large.rawValue &&
                (fixedStateValue + value) < SizeState.defalt.rawValue {
            return true
        } else { return false }
    }
    
    func calcPadding(_ value: CGFloat, ended: Bool) {
        if !ended {
            topPadding = fixedStateValue + value
        } else {
            topPadding = sizeState.rawValue
        }
    }
}
