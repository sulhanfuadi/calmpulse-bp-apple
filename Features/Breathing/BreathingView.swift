import SwiftUI

struct BreathingView: View {
    @EnvironmentObject private var appModel: AppStateModel
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var pulse = false

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "BREATH", tone: .neutral)
        } hero: {
            ScreenHeader(title: "In • Out", subtitle: "60s")
        } content: {
            ZStack {
                Circle()
                    .stroke(AppTheme.ColorToken.neutralGray, lineWidth: 5)
                    .frame(width: 72, height: 72)

                Circle()
                    .stroke(AppTheme.ColorToken.successGreen, lineWidth: 3)
                    .frame(width: 56, height: 56)
                    .scaleEffect(pulse ? (reduceMotion ? 1.02 : 1.08) : 0.94)

                Text("60")
                    .font(AppTheme.Typography.metric(compact: true))
                    .foregroundStyle(AppTheme.ColorToken.textPrimary)
            }
            .onAppear { pulse = true }
            .animation(reduceMotion ? AppTheme.Motion.breathingReduced : AppTheme.Motion.breathing, value: pulse)
        } actions: {
            VStack(spacing: AppTheme.Spacing.xs) {
                CalmButton(title: "Done", tone: .primary, hint: "Lanjut refleksi") {
                    appModel.openReflection()
                }
                CalmButton(title: "Skip", tone: .ghost, hint: "Lewati sesi") {
                    appModel.openReflection()
                }
            }
        }
    }
}
