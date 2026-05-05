import SwiftUI

struct IdleView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Monitoring Aktif")
            ScreenHeader(
                title: "Mode Idle",
                subtitle: "Sistem siap memberi nudge ketika dibutuhkan"
            )

            CalmCard {
                Text("Baseline HR")
                    .font(AppTheme.Typography.subtitle)
                    .foregroundStyle(AppTheme.ColorToken.textSecondary)
                Text("\(appModel.baselineHR) bpm")
                    .font(AppTheme.Typography.metric)
                    .foregroundStyle(AppTheme.ColorToken.textPrimary)
            }

            CalmPrimaryButton(title: "Simulasi Trigger") {
                appModel.markTriggered()
            }

            CalmSecondaryButton(title: "Lihat Ringkasan") {
                appModel.openSummary()
            }
        }
    }
}
