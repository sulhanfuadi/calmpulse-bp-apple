import SwiftUI

struct BreathingView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        VStack(spacing: 8) {
            Text("Tarik - Hembus")
                .font(.headline)
            Text("Guided breathing placeholder")
                .font(.caption2)
            Button("Selesai") { appModel.openReflection() }
            Button("Lewati") { appModel.openReflection() }
        }
        .padding()
    }
}
