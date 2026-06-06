import SwiftUI

/// 一覧画面。行をタップするとサムネがズーム展開しながら詳細へ push する。
struct RootScreen: View {
    @Namespace private var namespace

    var body: some View {
        NavigationStack {
            List(AppScreen.allCases) { screen in
                NavigationLink {
                    DetailScreen(screen: screen)
                        .navigationTransition(.zoom(sourceID: screen, in: namespace))
                } label: {
                    RootCell(screen: screen, namespace: namespace)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Sandbox")
        }
    }
}

#Preview {
    RootScreen()
        .preferredColorScheme(.dark)
}
