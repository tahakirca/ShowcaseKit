//
//  ShowcaseSheetView.swift
//  ShowcaseKit
//
//  Created by Taha Kirca on 6.04.2026.
//

import SwiftUI

struct ShowcaseSheetView: View {
    let pages: [ShowcasePage]
    let config: ShowcaseConfig
    @Binding var isPresented: Bool
    let onDismiss: ((ShowcaseDismissReason) -> Void)?
    @State private var currentPage = 0

    private var isLastPage: Bool {
        currentPage >= pages.count - 1
    }

    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentPage) {
                ForEach(Array(pages.enumerated()), id: \.offset) { index, page in
                    ShowcasePageView(
                        page: page,
                        config: config
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))

            if pages.count > 1 {
                DotIndicator(
                    total: pages.count,
                    current: currentPage,
                    activeColor: config.dotActiveColor,
                    inactiveColor: config.dotInactiveColor
                )
                .accessibilityLabel("Page \(currentPage + 1) of \(pages.count)")
                .padding(.bottom, 24)
            }

            if isLastPage {
                Button {
                    onDismiss?(.completed)
                    isPresented = false
                } label: {
                    Text(pages[currentPage].buttonTitle)
                        .font(.body.weight(.semibold))
                        .foregroundStyle(config.buttonColor)
                }
                .accessibilityHint("Completes onboarding")
                .padding(.bottom, 32)
            } else {
                HStack {
                    Button {
                        onDismiss?(.skipped)
                        isPresented = false
                    } label: {
                        Text(config.skipText)
                            .font(.subheadline)
                            .foregroundStyle(config.skipColor)
                    }
                    .accessibilityHint("Skips onboarding")

                    Spacer()

                    Button {
                        withAnimation {
                            currentPage += 1
                        }
                    } label: {
                        HStack(spacing: 6) {
                            Text(config.nextText)
                                .font(.subheadline.weight(.medium))
                            Image(systemName: "arrow.right")
                                .font(.caption.weight(.medium))
                                .flipsForRightToLeftLayoutDirection(true)
                        }
                        .foregroundStyle(config.nextColor)
                    }
                    .accessibilityHint("Goes to next page")
                }
                .padding(.horizontal, 32)
                .padding(.bottom, 32)
            }
        }
        .background(config.backgroundColor)
        .interactiveDismissDisabled(!config.isSwipeDismissEnabled)
    }
}

private struct DotIndicator: View {
    let total: Int
    let current: Int
    let activeColor: Color
    let inactiveColor: Color

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<total, id: \.self) { index in
                Circle()
                    .fill(index == current ? activeColor : inactiveColor)
                    .frame(width: index == current ? 10 : 8, height: index == current ? 10 : 8)
                    .animation(.easeInOut(duration: 0.2), value: current)
            }
        }
    }
}
