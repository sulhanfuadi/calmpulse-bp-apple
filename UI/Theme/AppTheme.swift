import SwiftUI

enum AppTheme {
    enum ColorToken {
        static let bg = Color(red: 0.04, green: 0.04, blue: 0.05)
        static let bgAlt = Color(red: 0.07, green: 0.07, blue: 0.08)
        static let surface = Color(red: 0.11, green: 0.11, blue: 0.12)
        static let surfaceStrong = Color(red: 0.15, green: 0.15, blue: 0.16)

        static let textPrimary = Color.white
        static let textSecondary = Color(red: 0.73, green: 0.73, blue: 0.75)
        static let textMuted = Color(red: 0.55, green: 0.55, blue: 0.58)

        static let border = Color.white.opacity(0.12)

        static let neutralGray = Color(red: 0.30, green: 0.30, blue: 0.33)
        static let dangerRed = Color(red: 0.92, green: 0.29, blue: 0.24)
        static let successGreen = Color(red: 0.16, green: 0.72, blue: 0.42)
    }

    enum Spacing {
        static let xxs: CGFloat = 3
        static let xs: CGFloat = 5
        static let sm: CGFloat = 7
        static let md: CGFloat = 10
        static let lg: CGFloat = 12

        static func stack(compact: Bool) -> CGFloat { compact ? xs : sm }
        static func horizontal(compact: Bool) -> CGFloat { compact ? sm : md }
    }

    enum Radius {
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let pill: CGFloat = 999
    }

    enum Motion {
        static let press = Animation.easeOut(duration: 0.10)
        static let transition = Animation.easeOut(duration: 0.14)
        static let breathing = Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)
        static let breathingReduced = Animation.easeInOut(duration: 2.6).repeatForever(autoreverses: true)
    }

    enum Typography {
        static func title(compact: Bool) -> Font {
            compact ? .system(size: 14, weight: .semibold, design: .rounded)
                    : .system(size: 15, weight: .semibold, design: .rounded)
        }

        static func subtitle(compact: Bool) -> Font {
            compact ? .system(size: 10, weight: .regular, design: .rounded)
                    : .system(size: 11, weight: .regular, design: .rounded)
        }

        static func button(compact: Bool) -> Font {
            compact ? .system(size: 11, weight: .semibold, design: .rounded)
                    : .system(size: 12, weight: .semibold, design: .rounded)
        }

        static func metric(compact: Bool) -> Font {
            compact ? .system(size: 20, weight: .bold, design: .rounded)
                    : .system(size: 22, weight: .bold, design: .rounded)
        }
    }

    static var background: LinearGradient {
        LinearGradient(colors: [ColorToken.bg, ColorToken.bgAlt], startPoint: .top, endPoint: .bottom)
    }
}
