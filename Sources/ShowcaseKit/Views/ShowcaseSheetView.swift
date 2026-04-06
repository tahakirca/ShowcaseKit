//
//  ShowcaseSheetView.swift
//  ShowcaseKit
//
//  Created by Taha Kırca on 6.04.2026.

import SwiftUI

struct ShowcaseSheetView: View {
    let pages: [ShowcasePage]
    let config: ShowcaseConfig
    @Binding var isPresented: Bool
    @State private var currentPage = 0
    
    private var isLastPage: Bool {
        currentPage == pages.count - 1
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 0) {
                TabView(selection: $currentPage) {
                    ForEach(Array(pages.enumerated()), id: \.offset) { index, page in
                        ShowcasePageView(
                            page: page,
                            config: config,
                            showButton: index == pages.count - 1
                        ) {
                            isPresented = false
                        }
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
                    .padding(.bottom, 16)
                }
            }
            
            if !isLastPage {
                Button {
                    isPresented = false
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(config.dismissButtonColor)
                }
                .padding()
            }
        }
        .interactiveDismissDisabled()
    }
}

struct DotIndicator: View {
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
