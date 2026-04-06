//
//  ShowcaseSheetModifier.swift
//  ShowcaseKit
//
//  Created by Taha Kirca on 6.04.2026.
//

import SwiftUI

public enum ShowcaseDismissReason {
    case skipped
    case completed
}

private struct ShowcaseSheetModifier: ViewModifier {
    @Binding var isPresented: Bool
    let pages: [ShowcasePage]
    let config: ShowcaseConfig
    let onDismiss: ((ShowcaseDismissReason) -> Void)?

    func body(content: Content) -> some View {
        content
            .sheet(isPresented: $isPresented) {
                if pages.isEmpty {
                    EmptyView()
                } else {
                    ShowcaseSheetView(
                        pages: pages,
                        config: config,
                        isPresented: $isPresented,
                        onDismiss: onDismiss
                    )
                }
            }
    }
}

public extension View {
    func showcaseSheet(
        isPresented: Binding<Bool>,
        pages: [ShowcasePage],
        config: ShowcaseConfig = ShowcaseConfig(),
        onDismiss: ((ShowcaseDismissReason) -> Void)? = nil
    ) -> some View {
        modifier(ShowcaseSheetModifier(
            isPresented: isPresented,
            pages: pages,
            config: config,
            onDismiss: onDismiss
        ))
    }
}
