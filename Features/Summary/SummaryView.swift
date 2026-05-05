import SwiftUI

struct SummaryView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        GeometryReader { geo in
            let compact = geo.size.height < 212

            ScreenScaffold {
                StatusChip(title: "SUMMARY", tone: .success)
            } hero: {
                ScreenHeader(title: "Today", subtitle: compact ? nil : "Live session metrics")
            } content: {
                if let metrics = appModel.summaryMetrics() {
                    VStack(alignment: .leading, spacing: compact ? AppTheme.Spacing.xxs : AppTheme.Spacing.xs) {
                        HStack {
                            metric(title: "Triggers", value: "\(metrics.triggerCount)", compact: compact)
                            Spacer(minLength: AppTheme.Spacing.sm)
                            metric(title: "Calm", value: "\(metrics.calmCompletionRate)%", compact: compact)
                        }
                        HStack {
                            metric(title: "Avg Rec", value: String(format: "%.1fm", metrics.averageRecoveryMinutes), compact: compact)
                            Spacer(minLength: AppTheme.Spacing.sm)
                            metric(title: "Mood", value: metrics.lastSessionMood, compact: compact)
                        }
                    }
                } else {
                    VStack(alignment: .leading, spacing: AppTheme.Spacing.xxs) {
                        Text("No sessions yet")
                            .font(AppTheme.Typography.subtitle(compact: compact))
                            .foregroundStyle(AppTheme.ColorToken.textPrimary)
                        Text("Run one breathing flow to generate your first summary.")
                            .font(AppTheme.Typography.body(compact: compact))
                            .foregroundStyle(AppTheme.ColorToken.textMuted)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } actions: {
                CalmButton(title: "Back", tone: .primary, hint: "Return to idle monitoring") {
                    appModel.restartFlow()
                }
            }
        }
    }

    private func metric(title: String, value: String, compact: Bool) -> some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.xxs) {
            Text(title)
                .font(AppTheme.Typography.subtitle(compact: compact))
                .foregroundStyle(AppTheme.ColorToken.textMuted)
            Text(value)
                .font(AppTheme.Typography.metric(compact: compact))
                .foregroundStyle(AppTheme.ColorToken.textPrimary)
                .minimumScaleFactor(0.82)
                .lineLimit(1)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("\(title) \(value)"))
    }
}
