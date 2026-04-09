//
//  AnimatedSceneView.swift
//  ShowcaseKitDemo
//

import SwiftUI

struct AnimatedSceneView: View {
    @State private var moveForward = false
    @State private var sunPulse = false

    private let sphereSize: CGFloat = 260

    var body: some View {
        VStack(spacing: 20) {
            // Globe sphere containing the full scene
            ZStack {
                // Sky gradient background
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.cyan.opacity(0.25), .blue.opacity(0.08)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: sphereSize, height: sphereSize)

                // Sun — top right
                ZStack {
                    // Glow
                    Circle()
                        .fill(.yellow.opacity(0.2))
                        .frame(width: 50, height: 50)
                        .scaleEffect(sunPulse ? 1.3 : 1.0)
                        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: sunPulse)

                    // Sun body
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 32))
                        .foregroundStyle(.yellow)
                        .shadow(color: .orange.opacity(0.5), radius: 8)
                }
                .offset(x: 70, y: -70)

                // Clouds
                Image(systemName: "cloud.fill")
                    .font(.system(size: 22))
                    .foregroundStyle(.white.opacity(0.7))
                    .offset(x: moveForward ? 80 : -80, y: -40)
                    .animation(.linear(duration: 6).repeatForever(autoreverses: false), value: moveForward)

                Image(systemName: "cloud.fill")
                    .font(.system(size: 16))
                    .foregroundStyle(.white.opacity(0.5))
                    .offset(x: moveForward ? 60 : -90, y: -15)
                    .animation(.linear(duration: 8).repeatForever(autoreverses: false), value: moveForward)

                // Airplane
                Image(systemName: "airplane")
                    .font(.system(size: 30))
                    .foregroundStyle(.purple)
                    .shadow(color: .purple.opacity(0.4), radius: 6, y: 3)
                    .offset(x: moveForward ? 100 : -100, y: moveForward ? -55 : -35)
                    .animation(.easeInOut(duration: 5).repeatForever(autoreverses: false), value: moveForward)

                // Ground
                Ellipse()
                    .fill(
                        LinearGradient(
                            colors: [.green.opacity(0.35), .green.opacity(0.15)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: sphereSize, height: 80)
                    .offset(y: 70)

                // Road
                RoundedRectangle(cornerRadius: 4)
                    .fill(.gray.opacity(0.35))
                    .frame(width: sphereSize - 40, height: 30)
                    .overlay {
                        HStack(spacing: 10) {
                            ForEach(0..<8, id: \.self) { _ in
                                RoundedRectangle(cornerRadius: 1)
                                    .fill(.white.opacity(0.6))
                                    .frame(width: 14, height: 2)
                            }
                        }
                    }
                    .offset(y: 60)

                // Car
                Image(systemName: "car.side.fill")
                    .font(.system(size: 26))
                    .foregroundStyle(.blue)
                    .scaleEffect(x: -1, y: 1)
                    .shadow(color: .blue.opacity(0.3), radius: 4, y: 2)
                    .offset(x: moveForward ? 90 : -90, y: 48)
                    .animation(.easeInOut(duration: 4).repeatForever(autoreverses: false), value: moveForward)

                // Sphere border ring
                Circle()
                    .strokeBorder(
                        LinearGradient(
                            colors: [.purple.opacity(0.4), .blue.opacity(0.2), .cyan.opacity(0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 3
                    )
                    .frame(width: sphereSize, height: sphereSize)

                // Glass reflection effect
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.white.opacity(0.15), .clear],
                            startPoint: .topLeading,
                            endPoint: .center
                        )
                    )
                    .frame(width: sphereSize - 6, height: sphereSize - 6)
            }
            .frame(width: sphereSize, height: sphereSize)
            .clipShape(Circle())
            .shadow(color: .purple.opacity(0.15), radius: 12, y: 6)

            // Label
            VStack(spacing: 4) {
                Text("Custom Views with Animations")
                    .font(.headline)
                Text("Embed any SwiftUI view in ShowcaseKit!")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .onAppear {
            moveForward = true
            sunPulse = true
        }
    }
}

#Preview {
    AnimatedSceneView()
}
