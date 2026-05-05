import SwiftUI

struct BreathingView: View {
    @EnvironmentObject private var appModel: AppStateModel
    @State private var pulse = false

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "Breathing Session", tone: .accent)
        } hero: {
            ScreenHeader(
                title: "Tarik • Hembus",
                subtitle: "Ikuti ritme pelan dan stabil selama 60 detik"
            )
        } content: {
            ZStack {
                Circle()
                    .fill(AppTheme.ColorToken.accentSoft.opacity(0.14))
                    .frame(width: 90, height: 90)
                    .scaleEffect(pulse ? 1.10 : 0.88)

                Circle()
                    .stroke(AppTheme.ColorToken.accent.opacity(0.55), lineWidth: 2)
                    .frame(width: 72, height: 72)
                    .scaleEffect(pulse ? 1.04 : 0.96)

                Text("60s")
                    .font(AppTheme.Typography.metric)
                    .foregroundStyle(AppTheme.ColorToken.textPrimary)
            }
            .frame(maxWidth: .infinity)
            .onAppear { pulse = true }
            .animation(AppTheme.Motion.breathing, value: pulse)
        } actions: {
            VStack(spacing: AppTheme.Spacing.sm) {
                CalmPrimaryButton(title: "Selesai") {
                    appModel.openReflection()
                }
                CalmSecondaryButton(title: "Lewati") {
                    appModel.openReflection()
                }
            }
        }
        .accessibilityElement(children: .contain)
    }
}
