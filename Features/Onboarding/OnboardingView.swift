import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
        VStack(spacing: 8) {
            Text("CalmPulse BP")
                .font(.headline)
            Text("Bukan alat diagnosis atau darurat")
                .font(.caption2)
                .multilineTextAlignment(.center)
            Button("Setuju & Mulai") { appModel.goToIdle() }
        }
        .padding()
    }
}
