
import SwiftUI

struct SheetView<Content: View>: View {

    @StateObject var sheetSizeManager: SheetSizeManager = SheetSizeManager(sizeState: .defalt)
    
    let title: String
    let fixed: Bool
    
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(spacing: 12) {
            GrabberView()
                .padding(.top, 12)
            TextCustom(text: title, size: 22, weight: .bold, color: .white)
                .frame(maxWidth: .infinity, alignment: .leading)
            content
                .gesture(DragGesture())
                .frame(maxHeight: .infinity, alignment: .center)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .background(Color.bgMain)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .padding(.top, sheetSizeManager.topPadding)
        .gesture(
            sheetSizeManager.dragGesture
                .onChanged({value in
                    if !fixed {
                        sheetSizeManager.dragGestureOnChanged(value)
                    }
                })
                .onEnded({ value in
                    if !fixed {
                        sheetSizeManager.dragGestureOnEnded(value)
                    }
                })
        )
        .ignoresSafeArea(.container, edges: [.top, .horizontal])
    }
}
