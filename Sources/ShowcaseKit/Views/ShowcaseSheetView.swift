//
//  ShowcaseSheetView.swift
//  ShowcaseKit
//
//  Created by Taha Kırca on 6.04.2026.

import SwiftUI

struct ShowcaseSheetView: View {
    let pages: [ShowcasePage]
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
                            showButton: index == pages.count - 1
                        ) {
                            isPresented = false
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                if pages.count > 1 {
                    DotIndicator(total: pages.count, current: currentPage)
                        .padding(.bottom, 16)
                }
            }
            
            if !isLastPage {
                Button {
                    isPresented = false
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.secondary)
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
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<total, id: \.self) { index in
                Circle()
                    .fill(index == current ? Color.gray.opacity(0.9) : Color.secondary.opacity(0.3))
                    .frame(width: index == current ? 10 : 8, height: index == current ? 10 : 8)
                    .animation(.easeInOut(duration: 0.2), value: current)
            }
        }
    }
}
