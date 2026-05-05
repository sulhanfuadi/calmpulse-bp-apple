import SwiftUI

struct TriggeredView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        VStack(spacing: 8) {
            Text("Perlu Jeda")
                .font(.headline)
            Text("Sinyal stres terdeteksi")
                .font(.caption2)
            Button("Mulai Breathing 60s") { appModel.startBreathing() }
        }
        .padding()
    }
}
