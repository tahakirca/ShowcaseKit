//
//  ShowcaseRow.swift
//  ShowcaseKit
//
//  Created by Taha Kırca on 6.04.2026.
//
import Foundation

import Foundation
                                                          
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
}
                                                          
public enum ShowcaseImage {
    case system(String)
    case custom(String)
}
