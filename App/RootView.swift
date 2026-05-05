import SwiftUI

struct RootView: View {
    @EnvironmentObject private var appModel: AppStateModel

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
        .transition(.asymmetric(insertion: .opacity.combined(with: .scale(scale: 0.985)), removal: .opacity))
        .animation(AppTheme.Motion.transition, value: appModel.state)
    }
}
