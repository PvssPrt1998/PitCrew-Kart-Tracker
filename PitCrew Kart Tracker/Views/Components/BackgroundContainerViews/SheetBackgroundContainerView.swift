import SwiftUI

struct SheetBackgroundContainerView<Content: View>: View {
    
    var title: String?
    let globalHorizontalPadding: CGFloat = 16
    
    @ViewBuilder let content: Content
    
    var body: some View {
        ZStack {
            Color.bgSecond.ignoresSafeArea(.container, edges: .top)
            VStack {
                GrabberView()
                    .padding(5)
                if let title = title {
                    TitleView(text: title, titlePlacement: .center)
                        .padding(EdgeInsets(top: 11, leading: 0, bottom: 11, trailing: 0))
                }
            }
            .frame(maxHeight: .infinity, alignment: .top)
            VStack(spacing: 20) {
                VStack(spacing: 0) {
                    GrabberView().padding(5).hidden()
                    if let title = title {
                        TitleView(text: title, titlePlacement: .center)
                            .padding(EdgeInsets(top: 11, leading: 0, bottom: 11, trailing: 0))
                            .hidden()
                    }
                }
                content
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, globalHorizontalPadding)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SheetBackgroundContainerView(title: "Title") {
        Text("123")
    }
}
