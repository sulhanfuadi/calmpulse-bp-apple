import SwiftUI

struct IdleView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Monitoring Aktif", tone: .success)
        } hero: {
            ScreenHeader(
                title: "Mode Idle",
                subtitle: "Sistem siap memberi nudge saat sinyal stres meningkat"
            )
        } content: {
            CalmCard {
                Text("Baseline Heart Rate")
                    .font(AppTheme.Typography.subtitle)
                    .foregroundStyle(AppTheme.ColorToken.textTertiary)
                Text("\(appModel.baselineHR) bpm")
                    .font(AppTheme.Typography.metric)
                    .foregroundStyle(AppTheme.ColorToken.textPrimary)
            }
        } actions: {
            VStack(spacing: AppTheme.Spacing.sm) {
                CalmPrimaryButton(title: "Simulasi Trigger") {
                    appModel.markTriggered()
                }
                CalmSecondaryButton(title: "Lihat Ringkasan") {
                    appModel.openSummary()
                }
            }
        }
        .accessibilityElement(children: .contain)
    }
}
