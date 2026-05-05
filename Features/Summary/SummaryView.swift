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
                Text("Metrik harian")
                    .font(AppTheme.Typography.subtitle(compact: false))
                    .foregroundStyle(AppTheme.ColorToken.textTertiary)

                HStack {
                    metricItem(title: "Trigger", value: "\(appModel.sessions.count)")
                    Spacer(minLength: AppTheme.Spacing.lg)
                    metricItem(title: "Calming", value: "--%")
                }
            }
        } actions: {
            CalmPrimaryButton(
                title: "Kembali Idle",
                accessibilityHint: "Kembali ke mode monitoring"
            ) {
                appModel.restartFlow()
            }
        }
    }

    private func metricItem(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.xxs) {
            Text(title)
                .font(AppTheme.Typography.subtitle(compact: false))
                .foregroundStyle(AppTheme.ColorToken.textTertiary)
            Text(value)
                .font(AppTheme.Typography.metric(compact: false))
                .foregroundStyle(AppTheme.ColorToken.textPrimary)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("\(title) \(value)"))
    }
}
