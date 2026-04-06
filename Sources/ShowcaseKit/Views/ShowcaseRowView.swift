//
//  ShowcaseRowView.swift
//  ShowcaseKit
//
//  Created by Taha Kırca on 6.04.2026.
//

import SwiftUI

import SwiftUI

struct ShowcaseRowView: View {
    let row: ShowcaseRow
    
    var body: some View {
        switch row.type {
        case .feature(let image, let title, let description):
            featureRow(image: image, title: title, description: description)
        case .hero(let image):
            heroRow(image: image)
        case .text(let text):
            textRow(text: text)
        }
    }
    
    @ViewBuilder
    private func featureRow(image: ShowcaseImage, title: String, description: String) -> some View {
        HStack(alignment: .top, spacing: 16) {
            showImage(image)
                .font(.system(size: 32))
                .foregroundStyle(Color.accentColor)
                .frame(width: 44, height: 44)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    @ViewBuilder
    private func heroRow(image: ShowcaseImage) -> some View {
        showImage(image)
            .font(.system(size: 80))
            .foregroundStyle(Color.accentColor)
            .frame(maxWidth: .infinity)
            .frame(height: 200)
    }
    
    @ViewBuilder
    private func textRow(text: String) -> some View {
        Text(text)
            .font(.body)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    private func showImage(_ image: ShowcaseImage) -> some View {
        switch image {
        case .system(let name):
            Image(systemName: name)
        case .custom(let name):
            Image(name)
                .resizable()
                .scaledToFit()
        }
    }
}
