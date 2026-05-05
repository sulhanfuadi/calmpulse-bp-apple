import SwiftUI

struct TriggeredView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Stress Signal", tone: .warning)
        } hero: {
            ScreenHeader(
                title: "Perlu Jeda",
                subtitle: "Ambil satu menit untuk breathing flow yang lebih tenang."
            )
        } content: {
            CalmCard(variant: .compact) {
                Text("Prioritas sekarang: turunkan intensitas respons stres secara perlahan.")
                    .font(AppTheme.Typography.subtitle(compact: false))
                    .foregroundStyle(AppTheme.ColorToken.textSecondary)
            }
        } actions: {
            CalmPrimaryButton(title: "Mulai Breathing 60s") {
                appModel.startBreathing()
            }
        }
        .accessibilityElement(children: .contain)
    }
}
