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
                    .stroke(AppTheme.ColorToken.neutralGray, lineWidth: 6)
                    .frame(width: 78, height: 78)

                Circle()
                    .stroke(AppTheme.ColorToken.successGreen.opacity(0.92), lineWidth: 4)
                    .frame(width: 62, height: 62)
                    .scaleEffect(pulse ? (reduceMotion ? 1.02 : 1.10) : 0.92)

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
