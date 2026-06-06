import SwiftUI

struct CounterScreen: View {
    @State private var count = 0

    var body: some View {
        VStack(spacing: 40) {
            Text("\(count)")
                .font(.system(size: 96, weight: .bold, design: .rounded))
                .contentTransition(.numericText(value: Double(count)))
                .animation(.snappy, value: count)

            Button {
                count += 1
            } label: {
                Image(systemName: "plus")
                    .font(.title.bold())
                    .frame(width: 80, height: 80)
                    .background(.orange.gradient, in: .circle)
                    .foregroundStyle(.white)
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    CounterScreen()
        .preferredColorScheme(.dark)
}
