import SwiftUI

struct IdleView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "IDLE", tone: .success)
        } hero: {
            ScreenHeader(title: "Monitoring", subtitle: "Stable")
        } content: {
            HStack(alignment: .center) {
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
            .padding(.horizontal, AppTheme.Spacing.xs)
        } actions: {
            VStack(spacing: AppTheme.Spacing.xs) {
                CalmButton(title: "Trigger", tone: .primary, hint: "Simulasi stress signal") {
                    appModel.markTriggered()
                }
                CalmButton(title: "Summary", tone: .secondary, hint: "Buka ringkasan") {
                    appModel.openSummary()
                }
            }
        }
    }
}
