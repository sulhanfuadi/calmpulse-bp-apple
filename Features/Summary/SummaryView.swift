import SwiftUI

struct SummaryView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Daily Summary", tone: .accent)
        } hero: {
            ScreenHeader(
                title: "Ringkasan Harian",
                subtitle: "Lihat progres regulasi harian secara ringkas"
            )
        } content: {
            CalmCard(variant: .elevated) {
                HStack {
                    metricItem(title: "Trigger", value: "\(appModel.sessions.count)")
                    Spacer(minLength: AppTheme.Spacing.lg)
                    metricItem(title: "Calming", value: "--%")
                }
            }
        } actions: {
            CalmPrimaryButton(title: "Kembali Idle") {
                appModel.restartFlow()
            }
        }
    }

    private func metricItem(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.xxs) {
            Text(title)
                .font(AppTheme.Typography.subtitle)
                .foregroundStyle(AppTheme.ColorToken.textTertiary)
            Text(value)
                .font(AppTheme.Typography.metric)
                .foregroundStyle(AppTheme.ColorToken.textPrimary)
        }
    }
}
