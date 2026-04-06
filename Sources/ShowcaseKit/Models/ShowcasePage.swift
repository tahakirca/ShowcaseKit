//
//  ShowcasePage.swift
//  ShowcaseKit
//
//  Created by Taha Kirca on 6.04.2026.
//

public struct ShowcasePage {
    public let title: String?
    public let rows: [ShowcaseRow]
    public let buttonTitle: String

    public init(
        title: String? = nil,
        rows: [ShowcaseRow],
        buttonTitle: String = "Continue"
    ) {
        self.title = title
        self.rows = rows
        self.buttonTitle = buttonTitle
    }
}
