import SwiftUI

struct UserOnboardingTabView: View {
    @ObservedObject var viewModel: UserOnboardingViewModel
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    init(viewModel: UserOnboardingViewModel) {
        self.viewModel = viewModel
        UIScrollView.appearance().bounces = false
    }//
    
    var body: some View {
        ZStack {
            ScrollView(.init()) {
                TabView(selection: $viewModel.selection) {
                    ForEach(viewModel.itemsRange, id: \.self) { index in
                        OnboardingView(title: viewModel.items[index].title,
                                       caption: viewModel.items[index].caption,
                                       backgroundImageTitle: viewModel.items[index].backgroundTitle)
                        .gesture(index == 2 ? DragGesture() : nil)//
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .overlay(
                    ZStack {
                        HStack(spacing: 15) {
                            if viewModel.selection != 2 {
                                ForEach(0..<viewModel.indicatorElementsCount, id: \.self) { index in
                                    Capsule()
                                        .fill(viewModel.colorByIndex(index))
                                        .frame(width: viewModel.widthByIndex(index), height: 8)
                                }
                            }
                            
                            Spacer()
                            NextButton(title: viewModel.selection == 2 ? "Enable" : "Next",
                                       action: {viewModel.selectionNext()})
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .padding(EdgeInsets(top: 0,
                                            leading: 15,
                                            bottom: safeAreaInsets.bottom + 10,
                                            trailing: 15))
                        if viewModel.selection == 2 {
                            CloseButton(action: viewModel.closeButton)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                                .padding(EdgeInsets(top: 12 + safeAreaInsets.top, leading: 0, bottom: 0, trailing: 16))
                        }
                    }
                )
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    UserOnboardingTabView(viewModel: UserOnboardingViewModel())
}
