import SwiftUI

struct SummaryView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Daily Summary")
            ScreenHeader(
                title: "Ringkasan Harian",
                subtitle: "Pantau progres self-regulation kamu"
            )

            CalmCard {
                HStack {
                    metricItem(title: "Trigger", value: "\(appModel.sessions.count)")
                    Spacer(minLength: AppTheme.Spacing.md)
                    metricItem(title: "Calming", value: "--%")
                }
            }

            CalmPrimaryButton(title: "Kembali Idle") {
                appModel.restartFlow()
            }
        }
    }

    private func metricItem(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.xxs) {
            Text(title)
                .font(AppTheme.Typography.subtitle)
                .foregroundStyle(AppTheme.ColorToken.textSecondary)
            Text(value)
                .font(AppTheme.Typography.metric)
                .foregroundStyle(AppTheme.ColorToken.textPrimary)
        }
    }
}
