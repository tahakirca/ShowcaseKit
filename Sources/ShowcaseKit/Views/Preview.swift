//
//  Preview.swift
//  ShowcaseKit
//
//  Created by Taha Kirca on 6.04.2026.
//

import SwiftUI

#Preview {
    struct PreviewWrapper: View {
        @State private var show = true

        private var config: ShowcaseConfig {
            ShowcaseConfig(
                accentColor: .indigo,
                iconColor: .indigo,
                dotActiveColor: .indigo,
                dotInactiveColor: .indigo.opacity(0.2),
                skipColor: .secondary,
                nextColor: .indigo
            )
        }

        private var pages: [ShowcasePage] {
            [featurePage, heroPage, customPage, finalPage]
        }

        private var featurePage: ShowcasePage {
            ShowcasePage(
                title: "Welcome to App",
                rows: [
                    ShowcaseRow(type: .feature(
                        image: .system("bell.badge.fill"),
                        title: "Smart Notifications",
                        description: "Get alerted the moment something needs your attention."
                    )),
                    ShowcaseRow(type: .feature(
                        image: .system("chart.line.uptrend.xyaxis"),
                        title: "Live Dashboard",
                        description: "Monitor your services in real time."
                    )),
                    ShowcaseRow(type: .feature(
                        image: .system("person.2.fill"),
                        title: "Team Collaboration",
                        description: "Assign, escalate and resolve together."
                    )),
                ]
            )
        }

        private var heroPage: ShowcasePage {
            ShowcasePage(
                title: "See the Big Picture",
                rows: [
                    ShowcaseRow(type: .hero(image: .system("globe.americas.fill"))),
                    ShowcaseRow(type: .text("Track incidents across all regions from a single view.")),
                ]
            )
        }

        private var customPage: ShowcasePage {
            ShowcasePage(
                rows: [
                    ShowcaseRow(type: .custom {
                        VStack(spacing: 20) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.indigo.opacity(0.08))
                                    .frame(width: 200, height: 200)

                                VStack(spacing: 12) {
                                    Image(systemName: "shield.checkered")
                                        .font(.system(size: 56))
                                        .foregroundStyle(.indigo)

                                    HStack(spacing: 6) {
                                        Circle().fill(.green).frame(width: 8, height: 8)
                                        Text("All Systems Operational")
                                            .font(.caption.weight(.medium))
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }

                            Text("Status at a Glance")
                                .font(.title2.bold())

                            Text("Instantly see what's healthy\nand what needs attention.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)
                        }
                    }),
                ]
            )
        }

        private var finalPage: ShowcasePage {
            ShowcasePage(
                rows: [
                    ShowcaseRow(type: .custom {
                        VStack(spacing: 24) {
                            ZStack {
                                Circle()
                                    .fill(.green.opacity(0.1))
                                    .frame(width: 120, height: 120)
                                Circle()
                                    .fill(.green.opacity(0.06))
                                    .frame(width: 160, height: 160)
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 56))
                                    .foregroundStyle(.green)
                            }

                            Text("You're Ready")
                                .font(.title.bold())

                            Text("Let's get started.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                    }),
                ],
                buttonTitle: "Get Started"
            )
        }

        var body: some View {
            Text("Hello")
                .showcaseSheet(
                    isPresented: $show,
                    pages: pages,
                    config: config
                ) { reason in
                    switch reason {
                    case .skipped:
                        print("User skipped onboarding")
                    case .completed:
                        print("User completed onboarding")
                    }
                }
        }
    }

    return PreviewWrapper()
}
