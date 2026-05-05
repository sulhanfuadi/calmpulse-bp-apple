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

    struct SummaryMetrics {
        let triggerCount: Int
        let calmCompletionRate: Int
        let averageRecoveryMinutes: Double
        let lastSessionMood: String
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
    private var activeSession: SessionLogEntry?
    private var activeSessionStartedAt: Date?
    private var activeSessionCompleted = false

    func goToIdle() { transition(to: .idleMonitoring) }

    func markTriggered() {
        transition(to: .triggered)
        startNewSession(reason: .manualCheckIn)
    }

    func startBreathing() {
        transition(to: .breathingActive)
        activeSessionCompleted = true

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

    func openSummary() {
        finalizeActiveSession(mood: nil)
        transition(to: .summary)
    }

    func submitReflection(mood: ReflectionMood) {
        finalizeActiveSession(mood: mood)
        transition(to: .summary)
    }

    func restartFlow() { transition(to: .idleMonitoring) }

    func summaryMetrics() -> SummaryMetrics? {
        guard !sessions.isEmpty else { return nil }

        let completedSessions = sessions.filter { $0.sessionCompleted }.count
        let completionRate = Int((Double(completedSessions) / Double(sessions.count)) * 100.0)

        let recoverySamples = sessions.compactMap { entry -> Double? in
            guard let duration = entry.recoveryDurationSeconds else { return nil }
            return Double(duration) / 60.0
        }

        let averageRecovery: Double
        if recoverySamples.isEmpty {
            averageRecovery = 0
        } else {
            averageRecovery = recoverySamples.reduce(0, +) / Double(recoverySamples.count)
        }

        let lastMood = sessions.last?.moodAfter?.displayLabel ?? "-"

        return SummaryMetrics(
            triggerCount: sessions.count,
            calmCompletionRate: completionRate,
            averageRecoveryMinutes: averageRecovery,
            lastSessionMood: lastMood
        )
    }

    private func transition(to next: AppState) {
        state = next
    }

    private func startNewSession(reason: TriggerReason) {
        activeSessionStartedAt = Date()
        activeSessionCompleted = false
        activeSession = SessionLogEntry(
            timestamp: activeSessionStartedAt ?? Date(),
            triggerReason: reason,
            sessionCompleted: false,
            moodAfter: nil,
            optionalBP: nil,
            recoveryDurationSeconds: nil
        )
    }

    private func finalizeActiveSession(mood: ReflectionMood?) {
        guard var session = activeSession else { return }

        session.sessionCompleted = activeSessionCompleted
        session.moodAfter = mood

        if let startedAt = activeSessionStartedAt {
            let duration = max(0, Int(Date().timeIntervalSince(startedAt).rounded()))
            session.recoveryDurationSeconds = duration
        }

        sessions.append(session)
        activeSession = nil
        activeSessionStartedAt = nil
        activeSessionCompleted = false
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

private extension ReflectionMood {
    var displayLabel: String {
        switch self {
        case .lebihTenang:
            return "Calmer"
        case .masihTegang:
            return "Still tense"
        case .lewati:
            return "Skipped"
        }
    }
}
