import SwiftUI

/// 選択された画面の本体を表示する詳細ビュー。
struct DetailScreen: View {
    let screen: AppScreen

    var body: some View {
        screen.destination
            .navigationTitle(screen.title)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DetailScreen(screen: .counter)
    }
    .preferredColorScheme(.dark)
}
