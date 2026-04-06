//
//  Configuration.swift
//  ShowcaseKit
//
//  Created by Taha Kırca on 6.04.2026.
//

import SwiftUI

public struct ShowcaseConfig {
    public let accentColor: Color
    public let buttonColor: Color
    public let iconColor: Color
    public let dotActiveColor: Color
    public let dotInactiveColor: Color
    public let dismissButtonColor: Color
    
    public init(
        accentColor: Color = .blue,
        buttonColor: Color? = nil,
        iconColor: Color? = nil,
        dotActiveColor: Color? = nil,
        dotInactiveColor: Color? = nil,
        dismissButtonColor: Color? = nil
    ) {
        self.accentColor = accentColor
        self.buttonColor = buttonColor ?? accentColor
        self.iconColor = iconColor ?? accentColor
        self.dotActiveColor = dotActiveColor ?? Color.gray.opacity(0.8)
        self.dotInactiveColor = dotInactiveColor ?? Color.secondary.opacity(0.3)
        self.dismissButtonColor = dismissButtonColor ?? Color.secondary
    }
}
