import SwiftUI

struct SummaryView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        VStack(spacing: 8) {
            Text("Ringkasan Harian")
                .font(.headline)
            Text("Trigger: \(appModel.sessions.count)")
                .font(.caption2)
            Button("Kembali Idle") { appModel.restartFlow() }
        }
        .padding()
    }
}
