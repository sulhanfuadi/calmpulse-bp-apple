import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Wellness Companion")
            ScreenHeader(
                title: "CalmPulse BP",
                subtitle: "Bukan alat diagnosis atau layanan darurat"
            )

            CalmCard {
                Text("Bantu kamu pause sejenak saat sinyal stres meningkat, lalu refleksi singkat setelahnya.")
                    .font(AppTheme.Typography.subtitle)
                    .foregroundStyle(AppTheme.ColorToken.textSecondary)
            }

            CalmPrimaryButton(title: "Setuju & Mulai") {
                appModel.goToIdle()
            }
        }
    }
}
