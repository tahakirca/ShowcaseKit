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
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                ShowcaseSheetView(pages: pages, isPresented: $isPresented)
            }
    }
}

public extension View {
    func showcaseSheet(isPresented: Binding<Bool>, pages: [ShowcasePage]) -> some View {
        modifier(ShowcaseSheetModifier(isPresented: isPresented, pages: pages))
    }
}

