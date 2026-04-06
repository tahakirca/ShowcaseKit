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
        VStack(spacing: 0) {
            Spacer()

            if let title = page.title {
                Text(title)
                    .font(.largeTitle.bold())
                    .foregroundStyle(config.titleColor)
                    .minimumScaleFactor(0.7)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .padding(.bottom, 56)
            }

            VStack(alignment: .center, spacing: 28) {
                ForEach(page.rows) { row in
                    ShowcaseRowView(row: row, config: config)
                }
            }
            .padding(.horizontal, 32)

            Spacer()
        }
    }
}
