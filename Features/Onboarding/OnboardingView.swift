import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            EmptyView()
        } hero: {
            ScreenHeader(title: "CalmPulse BP", subtitle: "Bukan diagnosis")
        } content: {
            Text("Self-awareness only")
                .font(AppTheme.Typography.subtitle(compact: true))
                .foregroundStyle(AppTheme.ColorToken.textMuted)
                .frame(maxWidth: .infinity)
        } actions: {
            CalmButton(title: "Mulai", tone: .primary, hint: "Masuk mode monitoring") {
                appModel.goToIdle()
            }
        }
    }
}
