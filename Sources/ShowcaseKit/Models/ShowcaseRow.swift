//
//  ShowcaseRow.swift
//  ShowcaseKit
//
//  Created by Taha Kirca on 6.04.2026.
//

import SwiftUI

public struct ShowcaseRow: Identifiable {
    public let id = UUID()
    public let type: ShowcaseRowType

    public init(type: ShowcaseRowType) {
        self.type = type
    }
}

public enum ShowcaseRowType {
    case feature(image: ShowcaseImage, title: String, description: String)
    case hero(image: ShowcaseImage)
    case text(String)
    case custom(AnyView)
}

public extension ShowcaseRowType {
    static func custom<Content: View>(@ViewBuilder _ builder: () -> Content) -> ShowcaseRowType {
        .custom(AnyView(builder()))
    }
}

public enum ShowcaseImage {
    case system(String)
    case asset(String)
}
