import SwiftUI

struct BreathingView: View {
    @EnvironmentObject private var appModel: AppStateModel
    @State private var pulse = false

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Breathing Session")
            ScreenHeader(
                title: "Tarik • Hembus",
                subtitle: "Ikuti ritme pelan selama 60 detik"
            )

            ZStack {
                Circle()
                    .fill(AppTheme.ColorToken.accentSecondary.opacity(0.20))
                    .frame(width: 76, height: 76)
                    .scaleEffect(pulse ? 1.08 : 0.92)
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: pulse)

                Text("60s")
                    .font(AppTheme.Typography.metric)
                    .foregroundStyle(AppTheme.ColorToken.textPrimary)
            }
            .onAppear { pulse = true }

            CalmPrimaryButton(title: "Selesai") {
                appModel.openReflection()
            }

            CalmSecondaryButton(title: "Lewati") {
                appModel.openReflection()
            }
        }
    }
}
