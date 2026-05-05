import SwiftUI

struct TriggeredView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Stress Signal", tone: AppTheme.ColorToken.warning)
            ScreenHeader(
                title: "Perlu Jeda",
                subtitle: "Sinyal stres terdeteksi. Ambil 60 detik untuk regulasi napas."
            )

            CalmPrimaryButton(title: "Mulai Breathing 60s") {
                appModel.startBreathing()
            }
        }
    }
}
