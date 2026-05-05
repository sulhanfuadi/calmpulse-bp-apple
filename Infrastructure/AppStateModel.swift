import Combine
import Foundation

final class AppStateModel: ObservableObject {
    enum BreathingPhase: String {
        case inhale
        case exhale

        var label: String {
            switch self {
            case .inhale: return "Inhale"
            case .exhale: return "Exhale"
            }
        }
    }

    @Published private(set) var state: AppState = .onboarding
    @Published var screenshotModeEnabled: Bool = true
    @Published var baselineHR: Int = 72
    @Published var sessions: [SessionLogEntry] = []
    @Published private(set) var breathingRemainingSeconds: Int = 60
    @Published private(set) var breathingPhase: BreathingPhase = .inhale

    let config: AppConfig = .default
    let breathingTotalSeconds: Int = 60
    let breathingPhaseDuration: Int = 4

    private var breathingTimer: Timer?

    func goToIdle() { transition(to: .idleMonitoring) }
    func markTriggered() { transition(to: .triggered) }
    func startBreathing() {
        transition(to: .breathingActive)
        if screenshotModeEnabled {
            breathingRemainingSeconds = 42
            breathingPhase = .inhale
            return
        }
        beginBreathingSession()
    }
    func openReflection() {
        breathingTimer?.invalidate()
        breathingTimer = nil
        transition(to: .reflectionPending)
    }
    func openSummary() { transition(to: .summary) }
    func restartFlow() { transition(to: .idleMonitoring) }

    private func transition(to next: AppState) {
        state = next
    }

    private func beginBreathingSession() {
        breathingTimer?.invalidate()
        breathingRemainingSeconds = breathingTotalSeconds
        breathingPhase = .inhale

        breathingTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self else { return }

            if self.breathingRemainingSeconds > 0 {
                self.breathingRemainingSeconds -= 1
                self.updateBreathingPhase()
            }

            if self.breathingRemainingSeconds == 0 {
                self.finishBreathingSession()
            }
        }
    }

    private func updateBreathingPhase() {
        let elapsed = breathingTotalSeconds - breathingRemainingSeconds
        let segment = (elapsed / breathingPhaseDuration) % 2
        breathingPhase = segment == 0 ? .inhale : .exhale
    }

    private func finishBreathingSession() {
        breathingTimer?.invalidate()
        breathingTimer = nil
        openReflection()
    }
}
