import Combine
import Foundation

final class AppStateModel: ObservableObject {
    @Published var state: AppState = .onboarding
    @Published var baselineHR: Int = 72
    @Published var sessions: [SessionLogEntry] = []

    let config: AppConfig = .default

    func goToIdle() { state = .idleMonitoring }
    func markTriggered() { state = .triggered }
    func startBreathing() { state = .breathingActive }
    func openReflection() { state = .reflectionPending }
    func openSummary() { state = .summary }
    func restartFlow() { state = .idleMonitoring }
}
