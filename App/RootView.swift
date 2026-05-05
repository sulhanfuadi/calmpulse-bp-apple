import SwiftUI

struct RootView: View {
    @EnvironmentObject private var appModel: AppStateModel

    var body: some View {
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
}
