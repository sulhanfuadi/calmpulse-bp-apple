import SwiftUI

struct RootView: View {
    @EnvironmentObject private var appModel: AppStateModel
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        Group {
            switch appModel.state {
            case .onboarding:
                OnboardingView()
            case .idleMonitoring:
                IdleView()
            case .triggered:
                TriggeredView()
            case .breathingActive:
                BreathingView()
            case .reflectionPending:
                ReflectionView()
            case .summary:
                SummaryView()
            }
        }
        .transition(reduceMotion ? .opacity : .asymmetric(insertion: .opacity.combined(with: .scale(scale: 0.985)), removal: .opacity))
        .animation(AppTheme.Motion.transition, value: appModel.state)
    }
}
