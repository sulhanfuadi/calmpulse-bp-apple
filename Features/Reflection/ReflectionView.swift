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
                CalmButton(title: "Calmer", tone: .primary, hint: "Log calmer mood") {
                    appModel.submitReflection(mood: .lebihTenang)
                }
                CalmButton(title: "Still tense", tone: .secondary, hint: "Log as still tense") {
                    appModel.submitReflection(mood: .masihTegang)
                }
                CalmButton(title: "Skip", tone: .ghost, hint: "Skip reflection") {
                    appModel.submitReflection(mood: .lewati)
                }
            }
        }
    }
}
