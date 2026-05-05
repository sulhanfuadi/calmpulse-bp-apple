import SwiftUI

struct SummaryView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "SUMMARY", tone: .success)
        } hero: {
            ScreenHeader(title: "Today", subtitle: nil)
        } content: {
            HStack {
                metric(title: "TRG", value: "\(appModel.sessions.count)")
                Spacer(minLength: AppTheme.Spacing.md)
                metric(title: "CALM", value: "--")
            }
        } actions: {
            CalmButton(title: "Back", tone: .primary, hint: "Kembali ke idle") {
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
