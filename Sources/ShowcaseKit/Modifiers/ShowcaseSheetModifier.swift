//
//  ShowcaseSheetModifier.swift
//  ShowcaseKit
//
//  Created by Taha Kırca on 6.04.2026.
//

import SwiftUI

struct ShowcaseSheetModifier: ViewModifier {
    @Binding var isPresented: Bool
    let pages: [ShowcasePage]
    let config: ShowcaseConfig
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                ShowcaseSheetView(pages: pages, config: config, isPresented: $isPresented)
            }
    }
}

public extension View {
    func showcaseSheet(
        isPresented: Binding<Bool>,
        pages: [ShowcasePage],
        config: ShowcaseConfig = ShowcaseConfig()
    ) -> some View {
        modifier(ShowcaseSheetModifier(isPresented: isPresented, pages: pages, config: config))
    }
}

