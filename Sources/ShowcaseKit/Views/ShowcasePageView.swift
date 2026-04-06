//
//  ShowcasePageView.swift
//  ShowcaseKit
//
//  Created by Taha Kırca on 6.04.2026.
//

import SwiftUI

struct ShowcasePageView: View {
    let page: ShowcasePage
    let showButton: Bool
    let onContinue: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            Text(page.title)
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
                .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 24) {
                ForEach(page.rows) { row in
                    ShowcaseRowView(row: row)
                }
            }
            .padding(.horizontal, 32)
            
            Spacer()
            Spacer()
            
            if showButton {
                Button(action: onContinue) {
                    Text(page.buttonTitle)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                }
                .buttonStyle(.borderedProminent)
                .padding(.horizontal, 32)
                .padding(.bottom, 32)
            }
        }
    }
}
