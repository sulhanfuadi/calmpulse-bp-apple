import SwiftUI

struct ReflectionView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "CHECK", tone: .neutral)
        } hero: {
            ScreenHeader(title: "How now?", subtitle: nil)
        } content: {
            EmptyView()
        } actions: {
            VStack(spacing: AppTheme.Spacing.xs) {
                CalmButton(title: "Calmer", tone: .primary, hint: "Catat lebih tenang") {
                    appModel.openSummary()
                }
                CalmButton(title: "Still Tight", tone: .secondary, hint: "Catat masih tegang") {
                    appModel.openSummary()
                }
                CalmButton(title: "Skip", tone: .ghost, hint: "Lewati refleksi") {
                    appModel.openSummary()
                }
            }
        }
    }
}
