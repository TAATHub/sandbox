import SwiftUI

/// 一覧の 1 行。サムネに `matchedTransitionSource` を付けてズーム遷移の起点にする。
struct RootCell: View {
    let screen: AppScreen
    let namespace: Namespace.ID

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            screen.thumbnail
                .frame(width: 56, height: 56)
                .clipShape(.rect(cornerRadius: 8))
                .matchedTransitionSource(id: screen, in: namespace)

            VStack(alignment: .leading, spacing: 2) {
                Text(screen.title)
                    .font(.body)
                    .fontWeight(.semibold)
                Text(screen.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    struct Container: View {
        @Namespace var namespace
        var body: some View {
            List {
                RootCell(screen: .counter, namespace: namespace)
                RootCell(screen: .gradient, namespace: namespace)
                RootCell(screen: .waveText, namespace: namespace)
            }
            .listStyle(.plain)
        }
    }
    return Container()
        .preferredColorScheme(.dark)
}
