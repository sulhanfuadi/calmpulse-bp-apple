import SwiftUI

enum AppTheme {
    enum ColorToken {
        static let bg = Color.black
        static let bgElevated = Color(red: 0.10, green: 0.10, blue: 0.11)
        static let surface = Color(red: 0.14, green: 0.14, blue: 0.15)

        static let textPrimary = Color.white
        static let textSecondary = Color.white.opacity(0.72)
        static let textMuted = Color.white.opacity(0.55)

        static let border = Color.white.opacity(0.10)

        static let neutralGray = Color(red: 0.30, green: 0.30, blue: 0.33)
        static let dangerRed = Color(red: 0.92, green: 0.29, blue: 0.24)
        static let successGreen = Color(red: 0.16, green: 0.72, blue: 0.42)
    }

    enum Spacing {
        static let xxs: CGFloat = 2
        static let xs: CGFloat = 4
        static let sm: CGFloat = 6
        static let md: CGFloat = 8
        static let lg: CGFloat = 10

        static func stack(compact: Bool) -> CGFloat { compact ? xs : sm }
        static func horizontal(compact: Bool) -> CGFloat { compact ? sm : md }
    }

    enum Radius {
        static let sm: CGFloat = 8
        static let md: CGFloat = 10
    }

    enum Motion {
        static let press = Animation.easeOut(duration: 0.10)
        static let transition = Animation.easeOut(duration: 0.14)
        static let breathing = Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)
        static let breathingReduced = Animation.easeInOut(duration: 2.6).repeatForever(autoreverses: true)
    }

    enum Typography {
        static func title(compact: Bool) -> Font {
            compact ? .system(size: 13, weight: .semibold)
                    : .system(size: 14, weight: .semibold)
        }

        static func subtitle(compact: Bool) -> Font {
            compact ? .system(size: 10, weight: .regular)
                    : .system(size: 11, weight: .regular)
        }

        static func button(compact: Bool) -> Font {
            compact ? .system(size: 11, weight: .semibold)
                    : .system(size: 12, weight: .semibold)
        }

        static func metric(compact: Bool) -> Font {
            compact ? .system(size: 18, weight: .bold)
                    : .system(size: 20, weight: .bold)
        }
    }

    static var background: Color { ColorToken.bg }
}
