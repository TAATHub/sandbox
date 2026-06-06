import SwiftUI

struct GradientScreen: View {
    @State private var angle: Angle = .degrees(0)

    var body: some View {
        LinearGradient(
            colors: [.pink, .purple, .blue, .cyan],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .hueRotation(angle)
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.linear(duration: 6).repeatForever(autoreverses: false)) {
                angle = .degrees(360)
            }
        }
    }
}

#Preview {
    GradientScreen()
}
