//
//  ShowcaseRowView.swift
//  ShowcaseKit
//
//  Created by Taha Kirca on 6.04.2026.
//

import SwiftUI

struct ShowcaseRowView: View {
    let row: ShowcaseRow
    let config: ShowcaseConfig

    var body: some View {
        switch row.type {
        case .feature(let image, let title, let description):
            featureRow(image: image, title: title, description: description)
        case .hero(let image):
            heroRow(image: image)
        case .text(let text):
            textRow(text: text)
        case .custom(let customView):
            customView
                .frame(maxWidth: .infinity)
        }
    }

    private func featureRow(image: ShowcaseImage, title: String, description: String) -> some View {
        HStack(alignment: .top, spacing: 16) {
            imageView(image)
                .font(.system(size: 32))
                .foregroundStyle(config.iconColor)
                .frame(width: 44, height: 44)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .accessibilityElement(children: .combine)
    }

    private func heroRow(image: ShowcaseImage) -> some View {
        imageView(image)
            .font(.system(size: 80))
            .foregroundStyle(config.iconColor)
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .accessibilityHidden(true)
    }

    private func textRow(text: String) -> some View {
        Text(text)
            .font(.body)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
    }

    @ViewBuilder
    private func imageView(_ image: ShowcaseImage) -> some View {
        switch image {
        case .system(let name):
            Image(systemName: name)
        case .asset(let name):
            Image(name)
                .resizable()
                .scaledToFit()
        }
    }
}
