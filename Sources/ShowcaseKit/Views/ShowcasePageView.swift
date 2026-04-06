//
//  ShowcasePageView.swift
//  ShowcaseKit
//
//  Created by Taha Kirca on 6.04.2026.
//

import SwiftUI

struct ShowcasePageView: View {
    let page: ShowcasePage
    let config: ShowcaseConfig

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    Spacer(minLength: geometry.size.height * 0.08)

                    if let title = page.title {
                        Text(title)
                            .font(.largeTitle.bold())
                            .foregroundStyle(config.titleColor)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                            .padding(.bottom, 32)
                    }

                    VStack(alignment: .center, spacing: 28) {
                        ForEach(page.rows) { row in
                            ShowcaseRowView(row: row, config: config)
                        }
                    }
                    .padding(.horizontal, 32)

                    Spacer(minLength: geometry.size.height * 0.08)
                }
                .frame(minHeight: geometry.size.height)
            }
        }
    }
}
