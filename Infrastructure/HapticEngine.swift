import Foundation

protocol HapticEngine {
    func play(_ pattern: HapticPattern)
}

enum HapticPattern: String {
    case triggerNudge
    case breathingPace
    case breathingComplete
    case summaryConfirm
}

struct NoopHapticEngine: HapticEngine {
    func play(_ pattern: HapticPattern) {
        // Placeholder for watchOS haptic integration in future phase.
    }
}
