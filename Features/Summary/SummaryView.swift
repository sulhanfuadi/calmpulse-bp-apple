import SwiftUI

struct SummaryView: View {
    @EnvironmentObject private var appModel: AppStateModel

    private let demoMetrics = SummaryDemoMetrics(
        triggerCount: 4,
        calmCompletionRate: 78,
        averageRecoveryMinutes: 2.4,
        lastSessionMood: "Calmer"
    )

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "SUMMARY", tone: .success)
        } hero: {
            ScreenHeader(title: "Today", subtitle: "Demo snapshot")
        } content: {
            VStack(alignment: .leading, spacing: AppTheme.Spacing.xs) {
                HStack {
                    metric(title: "Triggers", value: "\(demoMetrics.triggerCount)")
                    Spacer(minLength: AppTheme.Spacing.md)
                    metric(title: "Calm", value: "\(demoMetrics.calmCompletionRate)%")
                }
                HStack {
                    metric(title: "Avg Rec", value: String(format: "%.1fm", demoMetrics.averageRecoveryMinutes))
                    Spacer(minLength: AppTheme.Spacing.md)
                    metric(title: "Mood", value: demoMetrics.lastSessionMood)
                }
            }
        } actions: {
            CalmButton(title: "Back", tone: .primary, hint: "Return to idle monitoring") {
                appModel.restartFlow()
            }
        }
    }

    private func metric(title: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.xxs) {
            Text(title)
                .font(AppTheme.Typography.subtitle(compact: true))
                .foregroundStyle(AppTheme.ColorToken.textMuted)
            Text(value)
                .font(AppTheme.Typography.metric(compact: true))
                .foregroundStyle(AppTheme.ColorToken.textPrimary)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("\(title) \(value)"))
    }
}

private struct SummaryDemoMetrics {
    let triggerCount: Int
    let calmCompletionRate: Int
    let averageRecoveryMinutes: Double
    let lastSessionMood: String
}
