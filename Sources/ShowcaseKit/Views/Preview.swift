import SwiftUI

#Preview {
    struct PreviewWrapper: View {
        @State private var show = true
        
        var body: some View {
            Text("Hello")
                .showcaseSheet(
                    isPresented: $show,
                    pages: [
                        ShowcasePage(
                            title: "Welcome to ShowcaseKit",
                            rows: [
                                ShowcaseRow(type: .hero(image: .system("app.gift.fill"))),
                                ShowcaseRow(type: .feature(
                                    image: .system("bell.fill"),
                                    title: "Smart Alerts",
                                    description: "Get notified instantly"
                                )),
                                ShowcaseRow(type: .feature(
                                    image: .system("chart.bar.fill"),
                                    title: "Analytics",
                                    description: "Track everything in real time"
                                )),
                            ]
                        ),
                        ShowcasePage(
                            title: "Ready to Go?",
                            rows: [
                                ShowcaseRow(type: .text("Everything is set up and ready for you.")),
                                ShowcaseRow(type: .feature(
                                    image: .system("rocket.fill"),
                                    title: "Get Started",
                                    description: "Launch your journey"
                                )),
                            ],
                            buttonTitle: "Get Started"
                        ),
                    ],
                    config: ShowcaseConfig(
                        accentColor: .orange,
                        dotActiveColor: .blue,
                        dismissButtonColor: .red
                    ),
                )
        }
    }
    
    return PreviewWrapper()
}
