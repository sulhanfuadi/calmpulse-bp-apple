import Foundation

public enum AppState: String, Codable, CaseIterable {
    case onboarding = "Onboarding"
    case idleMonitoring = "IdleMonitoring"
    case triggered = "Triggered"
    case breathingActive = "BreathingActive"
    case reflectionPending = "ReflectionPending"
    case summary = "Summary"
}

public enum TriggerReason: String, Codable {
    case hrAboveBaselineAndInactive
    case manualCheckIn
}

public enum ReflectionMood: String, Codable, CaseIterable {
    case lebihTenang
    case masihTegang
    case lewati
}
