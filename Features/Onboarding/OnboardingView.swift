import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            EmptyView()
        } hero: {
            ScreenHeader(title: "CalmPulse BP", subtitle: "Not a diagnosis")
        } content: {
            Text("Self-awareness only")
                .font(AppTheme.Typography.subtitle(compact: true))
                .foregroundStyle(AppTheme.ColorToken.textMuted)
                .frame(maxWidth: .infinity)
        } actions: {
            CalmButton(title: "Start", tone: .primary, hint: "Enter monitoring mode") {
                appModel.goToIdle()
            }
        }
    }
}
