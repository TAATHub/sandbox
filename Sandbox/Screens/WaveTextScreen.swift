import SwiftUI

struct WaveTextScreen: View {
    private let text = Array("Sandbox")
    @State private var phase = 0.0

    var body: some View {
        HStack(spacing: 4) {
            ForEach(Array(text.enumerated()), id: \.offset) { index, character in
                Text(String(character))
                    .font(.system(size: 48, weight: .heavy, design: .rounded))
                    .offset(y: sin(phase + Double(index) * 0.6) * 20)
                    .foregroundStyle(.teal.gradient)
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 1.2).repeatForever(autoreverses: false)) {
                phase = .pi * 2
            }
        }
    }
}

#Preview {
    WaveTextScreen()
        .preferredColorScheme(.dark)
}
