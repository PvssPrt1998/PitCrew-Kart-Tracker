import SwiftUI

struct BackgroundContainerView<Content: View>: View {
    
    var title: String?
    let globalHorizontalPadding: CGFloat = 16
    
    @ViewBuilder let content: Content
    
    var body: some View {
        ZStack {
            Color.bgSecond.ignoresSafeArea()
            if let title = title {
                TitleView(text: title, titlePlacement: .leading)
                    .padding(EdgeInsets(top: 3, leading: globalHorizontalPadding, bottom: 8, trailing: globalHorizontalPadding))
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            VStack(spacing: 0) {
                if let title = title {
                    TitleView(text: title, titlePlacement: .leading).hidden()
                        .padding(EdgeInsets(top: 3, leading: globalHorizontalPadding, bottom: 8, trailing: globalHorizontalPadding))
                }
                content
                    .padding(EdgeInsets(top: 20, leading: globalHorizontalPadding, bottom: 0, trailing: globalHorizontalPadding))
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    BackgroundContainerView(title: "Title") {
        Text("123")
    }
}
