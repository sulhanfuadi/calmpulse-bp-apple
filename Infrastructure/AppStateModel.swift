import Combine
import Foundation

final class AppStateModel: ObservableObject {
    @Published private(set) var state: AppState = .onboarding
    @Published var baselineHR: Int = 72
    @Published var sessions: [SessionLogEntry] = []

    let config: AppConfig = .default

    func goToIdle() { transition(to: .idleMonitoring) }
    func markTriggered() { transition(to: .triggered) }
    func startBreathing() { transition(to: .breathingActive) }
    func openReflection() { transition(to: .reflectionPending) }
    func openSummary() { transition(to: .summary) }
    func restartFlow() { transition(to: .idleMonitoring) }

    private func transition(to next: AppState) {
        state = next
    }
}
