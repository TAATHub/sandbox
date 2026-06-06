import SwiftUI

/// 全画面を一元管理する enum。case を追加すれば一覧に並ぶ。
enum AppScreen: String, CaseIterable, Identifiable, Hashable {
    case counter
    case gradient
    case waveText

    var id: String { rawValue }

    var title: String {
        switch self {
        case .counter: "Counter"
        case .gradient: "Gradient"
        case .waveText: "Wave Text"
        }
    }

    var subtitle: String {
        switch self {
        case .counter: "バネアニメーション付きカウンター"
        case .gradient: "アニメーションするグラデーション"
        case .waveText: "波打つテキストアニメーション"
        }
    }

    @ViewBuilder
    var thumbnail: some View {
        switch self {
        case .counter:
            Image(systemName: "plus.circle.fill")
                .font(.title)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.orange.gradient)
        case .gradient:
            LinearGradient(
                colors: [.pink, .purple, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .waveText:
            Text("~")
                .font(.title.bold())
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.teal.gradient)
        }
    }

    @ViewBuilder
    var destination: some View {
        switch self {
        case .counter: CounterScreen()
        case .gradient: GradientScreen()
        case .waveText: WaveTextScreen()
        }
    }
}
