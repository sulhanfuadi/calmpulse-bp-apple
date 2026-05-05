import SwiftUI

struct ReflectionView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Post Session")
            ScreenHeader(
                title: "Setelah sesi?",
                subtitle: "Pilih mood yang paling menggambarkan kondisi kamu"
            )

            CalmPrimaryButton(title: "Lebih Tenang") {
                appModel.openSummary()
            }

            CalmSecondaryButton(title: "Masih Tegang") {
                appModel.openSummary()
            }

            CalmSecondaryButton(title: "Lewati") {
                appModel.openSummary()
            }
        }
    }
}
