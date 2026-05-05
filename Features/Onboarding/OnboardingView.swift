import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Wellness Companion", tone: .accent)
        } hero: {
            ScreenHeader(
                title: "CalmPulse BP",
                subtitle: "Pause kecil yang membantu kamu regulasi stres harian."
            )
        } content: {
            CalmCard(variant: .elevated) {
                Text("Bukan alat diagnosis atau layanan darurat. Gunakan sebagai pendamping self-awareness.")
                    .font(AppTheme.Typography.subtitle)
                    .foregroundStyle(AppTheme.ColorToken.textSecondary)
            }
        } actions: {
            CalmPrimaryButton(title: "Setuju & Mulai") {
                appModel.goToIdle()
            }
        }
    }
}
