import Foundation

public struct AppConfig {
    public let hrThresholdDelta: Int
    public let cooldownMinutes: Int
    public let breathingDurationSeconds: Int

    public static let `default` = AppConfig(
        hrThresholdDelta: 14,
        cooldownMinutes: 45,
        breathingDurationSeconds: 60
    )
}
