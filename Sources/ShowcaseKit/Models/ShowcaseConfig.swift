//
//  ShowcaseConfig.swift
//  ShowcaseKit
//
//  Created by Taha Kirca on 6.04.2026.
//

import SwiftUI

public struct ShowcaseConfig: Sendable {
    public let accentColor: Color
    public let backgroundColor: Color
    public let titleColor: Color
    public let buttonColor: Color
    public let iconColor: Color
    public let dotActiveColor: Color
    public let dotInactiveColor: Color
    public let skipText: String
    public let skipColor: Color
    public let nextText: String
    public let nextColor: Color
    public let isSwipeDismissEnabled: Bool

    public init(
        accentColor: Color = .blue,
        backgroundColor: Color? = nil,
        titleColor: Color? = nil,
        buttonColor: Color? = nil,
        iconColor: Color? = nil,
        dotActiveColor: Color? = nil,
        dotInactiveColor: Color? = nil,
        skipText: String = "Skip",
        skipColor: Color? = nil,
        nextText: String = "Next",
        nextColor: Color? = nil,
        isSwipeDismissEnabled: Bool = false
    ) {
        self.accentColor = accentColor
        self.backgroundColor = backgroundColor ?? Color(.systemBackground)
        self.titleColor = titleColor ?? Color.primary
        self.buttonColor = buttonColor ?? accentColor
        self.iconColor = iconColor ?? accentColor
        self.dotActiveColor = dotActiveColor ?? accentColor
        self.dotInactiveColor = dotInactiveColor ?? Color.secondary.opacity(0.3)
        self.skipText = skipText
        self.skipColor = skipColor ?? Color.secondary
        self.nextText = nextText
        self.nextColor = nextColor ?? accentColor
        self.isSwipeDismissEnabled = isSwipeDismissEnabled
    }
}
