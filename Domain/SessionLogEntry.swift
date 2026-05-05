import Foundation

public struct OptionalBP: Codable {
    public let systolic: Int
    public let diastolic: Int
}

public struct SessionLogEntry: Codable, Identifiable {
    public let id: UUID
    public let timestamp: Date
    public let triggerReason: TriggerReason
    public var sessionCompleted: Bool
    public var moodAfter: ReflectionMood?
    public var optionalBP: OptionalBP?
    public var recoveryDurationSeconds: Int?

    public init(
        id: UUID = UUID(),
        timestamp: Date,
        triggerReason: TriggerReason,
        sessionCompleted: Bool,
        moodAfter: ReflectionMood?,
        optionalBP: OptionalBP?,
        recoveryDurationSeconds: Int?
    ) {
        self.id = id
        self.timestamp = timestamp
        self.triggerReason = triggerReason
        self.sessionCompleted = sessionCompleted
        self.moodAfter = moodAfter
        self.optionalBP = optionalBP
        self.recoveryDurationSeconds = recoveryDurationSeconds
    }
}
