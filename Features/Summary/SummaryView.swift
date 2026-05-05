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
        GeometryReader { geo in
            let compact = geo.size.height < 212

            ScreenScaffold {
                StatusChip(title: "SUMMARY", tone: .success)
            } hero: {
                ScreenHeader(title: "Today", subtitle: compact ? nil : "Demo snapshot")
            } content: {
                VStack(alignment: .leading, spacing: compact ? AppTheme.Spacing.xxs : AppTheme.Spacing.xs) {
                    HStack {
                        metric(title: "Triggers", value: "\(demoMetrics.triggerCount)", compact: compact)
                        Spacer(minLength: AppTheme.Spacing.sm)
                        metric(title: "Calm", value: "\(demoMetrics.calmCompletionRate)%", compact: compact)
                    }
                    HStack {
                        metric(title: "Avg Rec", value: String(format: "%.1fm", demoMetrics.averageRecoveryMinutes), compact: compact)
                        Spacer(minLength: AppTheme.Spacing.sm)
                        metric(title: "Mood", value: demoMetrics.lastSessionMood, compact: compact)
                    }
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

private struct SummaryDemoMetrics {
    let triggerCount: Int
    let calmCompletionRate: Int
    let averageRecoveryMinutes: Double
    let lastSessionMood: String
}
