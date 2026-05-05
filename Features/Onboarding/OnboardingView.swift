import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "READY", tone: .neutral)
        } hero: {
            ScreenHeader(title: "CalmPulse BP", subtitle: "Bukan diagnosis")
        } content: {
            CalmCard {
                Text("Self-awareness only")
                    .font(AppTheme.Typography.subtitle(compact: true))
                    .foregroundStyle(AppTheme.ColorToken.textMuted)
            }
        } actions: {
            CalmButton(title: "Mulai", tone: .primary, hint: "Masuk mode monitoring") {
                appModel.goToIdle()
            }
        }
    }
}
