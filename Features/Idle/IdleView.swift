import SwiftUI

struct IdleView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "MONITOR", tone: .success)
        } hero: {
            ScreenHeader(title: "Idle", subtitle: nil)
        } content: {
            HStack {
                Text("HR")
                    .font(AppTheme.Typography.subtitle(compact: true))
                    .foregroundStyle(AppTheme.ColorToken.textMuted)
                Spacer()
                Text("\(appModel.baselineHR)")
                    .font(AppTheme.Typography.metric(compact: true))
                    .foregroundStyle(AppTheme.ColorToken.textPrimary)
                Text("bpm")
                    .font(AppTheme.Typography.subtitle(compact: true))
                    .foregroundStyle(AppTheme.ColorToken.textSecondary)
            }
        } actions: {
            VStack(spacing: AppTheme.Spacing.xs) {
                CalmButton(title: "Trigger", tone: .primary, hint: "Simulasi sinyal stress") {
                    appModel.markTriggered()
                }
                CalmButton(title: "Summary", tone: .secondary, hint: "Open summary") {
                    appModel.openSummary()
                }
            }
        }
    }
}
