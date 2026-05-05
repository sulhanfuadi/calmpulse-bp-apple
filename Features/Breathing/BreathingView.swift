import SwiftUI

struct BreathingView: View {
    @EnvironmentObject private var appModel: AppStateModel
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
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
                    .scaleEffect(pulse ? (reduceMotion ? 1.03 : 1.10) : 0.90)

                Circle()
                    .stroke(AppTheme.ColorToken.accent.opacity(0.55), lineWidth: 2)
                    .frame(width: 72, height: 72)
                    .scaleEffect(pulse ? (reduceMotion ? 1.01 : 1.04) : 0.97)

                Text("60s")
                    .font(AppTheme.Typography.metric(compact: false))
                    .foregroundStyle(AppTheme.ColorToken.textPrimary)
            }
            .frame(maxWidth: .infinity)
            .onAppear { pulse = true }
            .animation(reduceMotion ? AppTheme.Motion.breathingReduced : AppTheme.Motion.breathing, value: pulse)
        } actions: {
            VStack(spacing: AppTheme.Spacing.sm) {
                CalmPrimaryButton(title: "Selesai", accessibilityHint: "Akhiri sesi breathing dan lanjut refleksi") {
                    appModel.openReflection()
                }
                CalmSecondaryButton(title: "Lewati", accessibilityHint: "Lewati sesi dan lanjut refleksi") {
                    appModel.openReflection()
                }
            }
        }
    }
}
