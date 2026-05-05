import SwiftUI

struct TriggeredView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "ALERT", tone: .danger)
        } hero: {
            ScreenHeader(title: "Stress Up", subtitle: "Take 60s")
        } content: {
            EmptyView()
        } actions: {
            CalmButton(title: "Start", tone: .primary, hint: "Mulai breathing") {
                appModel.startBreathing()
            }
        }
    }
}
