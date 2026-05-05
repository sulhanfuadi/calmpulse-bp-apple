import SwiftUI

struct IdleView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        VStack(spacing: 8) {
            Text("Mode Idle")
            Text("Monitoring pasif aktif")
                .font(.caption2)
            Button("Simulasi Trigger") { appModel.markTriggered() }
            Button("Lihat Ringkasan") { appModel.openSummary() }
        }
        .padding()
    }
}
