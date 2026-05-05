import SwiftUI

struct ReflectionView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Post Session", tone: .success)
        } hero: {
            ScreenHeader(
                title: "Setelah sesi?",
                subtitle: "Pilih kondisi yang paling mendekati perasaan kamu"
            )
        } content: {
            EmptyView()
        } actions: {
            VStack(spacing: AppTheme.Spacing.sm) {
                CalmPrimaryButton(title: "Lebih Tenang") {
                    appModel.openSummary()
                }
                CalmSecondaryButton(title: "Masih Tegang") {
                    appModel.openSummary()
                }
                CalmGhostButton(title: "Lewati") {
                    appModel.openSummary()
                }
            }
        }
    }
}
