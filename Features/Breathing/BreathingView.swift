import SwiftUI

struct BreathingView: View {
    @EnvironmentObject private var appModel: AppStateModel
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @Environment(\.scenePhase) private var scenePhase
    @State private var pulse = false

    var body: some View {
        ScreenScaffold {
            StatusChip(title: "BREATH", tone: .neutral)
        } hero: {
            ScreenHeader(title: appModel.breathingPhase.label, subtitle: "\(appModel.breathingRemainingSeconds)s left")
        } content: {
            GeometryReader { geo in
                let ringSize = min(geo.size.width, geo.size.height) * 0.88

            ZStack {
                Circle()
                    .stroke(AppTheme.ColorToken.neutralGray, lineWidth: 5)
                        .frame(width: ringSize, height: ringSize)

                Circle()
                    .stroke(AppTheme.ColorToken.successGreen, lineWidth: 3)
                        .frame(width: ringSize * 0.78, height: ringSize * 0.78)
                    .scaleEffect(pulse ? (reduceMotion ? 1.02 : 1.08) : 0.94)

                Text("\(appModel.breathingRemainingSeconds)")
                    .font(AppTheme.Typography.metric(compact: true))
                    .foregroundStyle(AppTheme.ColorToken.textPrimary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .onAppear { pulse = true }
            .onChange(of: scenePhase) { _, newPhase in
                if newPhase == .active { pulse = true }
            }
            .animation(reduceMotion ? AppTheme.Motion.breathingReduced : AppTheme.Motion.breathing, value: pulse)
        } actions: {
            VStack(spacing: AppTheme.Spacing.xs) {
                CalmButton(title: "Done", tone: .primary, hint: "Open reflection") {
                    appModel.openReflection()
                }
                CalmButton(title: "Skip", tone: .ghost, hint: "Skip breathing session") {
                    appModel.openReflection()
                }
            }
        }
    }
}
