//
//  ContentView.swift
//  ShowcaseKitDemo
//

import ShowcaseKit
import SwiftUI

struct ContentView: View {
    @State private var showDefault = false
    @State private var showCustom = false
    @State private var dismissReason: String?

    var body: some View {
        NavigationStack {
            List {
                Section("Examples") {
                    Button("Default Showcase") {
                        showDefault = true
                    }

                    Button("Custom Themed Showcase") {
                        showCustom = true
                    }
                }

                if let reason = dismissReason {
                    Section("Last Dismiss Reason") {
                        Text(reason)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("ShowcaseKit Demo")
        }
        .showcaseSheet(
            isPresented: $showDefault,
            pages: defaultPages,
            onDismiss: { reason in
                switch reason {
                case .skipped:
                    dismissReason = "Skipped"
                case .completed:
                    dismissReason = "Completed"
                }
            }
        )
        .showcaseSheet(
            isPresented: $showCustom,
            pages: customPages,
            config: ShowcaseConfig(
                accentColor: .purple,
                skipText: "Not Now",
                nextText: "Next Step",
                isSwipeDismissEnabled: true
            ),
            onDismiss: { reason in
                switch reason {
                case .skipped:
                    dismissReason = "Skipped (Custom)"
                case .completed:
                    dismissReason = "Completed (Custom)"
                }
            }
        )
    }

    // MARK: - Default Pages

    private var defaultPages: [ShowcasePage] {
        [
            ShowcasePage(
                title: "Welcome to the App",
                rows: [
                    ShowcaseRow(type: .hero(image: .system("app.gift"))),
                    ShowcaseRow(type: .text("Discover all the amazing features we built for you.")),
                ]
            ),
            ShowcasePage(
                title: "Key Features",
                rows: [
                    ShowcaseRow(type: .feature(
                        image: .system("bolt.fill"),
                        title: "Lightning Fast",
                        description: "Experience blazing fast performance across the app."
                    )),
                    ShowcaseRow(type: .feature(
                        image: .system("lock.shield"),
                        title: "Secure",
                        description: "Your data is encrypted and protected at all times."
                    )),
                    ShowcaseRow(type: .feature(
                        image: .system("icloud"),
                        title: "Cloud Sync",
                        description: "Seamlessly sync your data across all your devices."
                    )),
                ]
            ),
            ShowcasePage(
                title: "Get Started",
                rows: [
                    ShowcaseRow(type: .hero(image: .system("checkmark.seal.fill"))),
                    ShowcaseRow(type: .text("You're all set! Tap below to begin your journey.")),
                ],
                buttonTitle: "Let's Go!"
            ),
        ]
    }

    // MARK: - Custom Themed Pages

    private var customPages: [ShowcasePage] {
        [
            ShowcasePage(
                title: "What's New",
                rows: [
                    ShowcaseRow(type: .feature(
                        image: .system("sparkles"),
                        title: "AI Assistant",
                        description: "Meet your new smart assistant powered by AI."
                    )),
                    ShowcaseRow(type: .feature(
                        image: .system("paintbrush.fill"),
                        title: "New Design",
                        description: "Enjoy a fresh, modern look with improved usability."
                    )),
                ]
            ),
            ShowcasePage(
                title: "Personalize",
                rows: [
                    ShowcaseRow(type: .custom {
                        AnimatedSceneView()
                    }),
                ],
                buttonTitle: "Done"
            ),
        ]
    }
}

#Preview {
    ContentView()
}
