

import SwiftUI

struct ReviewerOnboardingView: View {
    
    @ObservedObject var viewModel: ReviewerOnboardingViewModel
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    init(viewModel: ReviewerOnboardingViewModel) {
        self.viewModel = viewModel
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack {
            ScrollView(.init()) {
                TabView(selection: $viewModel.selection) {
                    ForEach(viewModel.itemsRange, id: \.self) { index in
                        OnboardingView(title: viewModel.items[index].title,
                                       caption: viewModel.items[index].caption,
                                       backgroundImageTitle: viewModel.items[index].backgroundTitle)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .overlay(
                    HStack(spacing: 15) {
                        ForEach(viewModel.itemsRange, id: \.self) { index in
                            Capsule()
                                .fill(viewModel.colorByIndex(index))
                                .frame(width: viewModel.widthByIndex(index), height: 8)
                        }
                        Spacer()
                        NextButton(action: {viewModel.nextButtonPressed()})
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .padding(EdgeInsets(top: 0,
                                    leading: 15,
                                    bottom: safeAreaInsets.bottom + 10,
                                    trailing: 15))
                )
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ReviewerOnboardingView(viewModel: ReviewerOnboardingViewModel())
}
