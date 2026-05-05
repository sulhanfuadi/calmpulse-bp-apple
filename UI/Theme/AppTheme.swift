import SwiftUI

enum AppTheme {
    enum ColorToken {
        static let base = Color(red: 0.03, green: 0.06, blue: 0.11)
        static let backgroundTop = Color(red: 0.05, green: 0.09, blue: 0.15)
        static let backgroundBottom = Color(red: 0.08, green: 0.13, blue: 0.22)

        static let surface1 = Color.white.opacity(0.07)
        static let surface2 = Color.white.opacity(0.10)
        static let surface3 = Color.white.opacity(0.14)

        static let strokeSoft = Color.white.opacity(0.12)
        static let strokeStrong = Color.white.opacity(0.22)
        static let overlaySoft = Color.black.opacity(0.18)

        static let textPrimary = Color.white
        static let textSecondary = Color(red: 0.81, green: 0.88, blue: 0.97)
        static let textTertiary = Color(red: 0.65, green: 0.74, blue: 0.87)

        static let textPrimaryHighLegibility = Color.white
        static let textSecondaryHighLegibility = Color.white.opacity(0.92)

        static let accent = Color(red: 0.51, green: 0.82, blue: 1.00)
        static let accentStrong = Color(red: 0.41, green: 0.74, blue: 1.00)
        static let accentSoft = Color(red: 0.48, green: 0.92, blue: 0.95)

        static let success = Color(red: 0.49, green: 0.90, blue: 0.84)
        static let warning = Color(red: 1.00, green: 0.62, blue: 0.54)
    }

    enum Spacing {
        static let xxs: CGFloat = 4
        static let xs: CGFloat = 6
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 20

        static func dynamic(compact: Bool) -> CGFloat {
            compact ? sm : md
        }
    }

    enum Radius {
        static let sm: CGFloat = 10
        static let md: CGFloat = 14
        static let lg: CGFloat = 18
        static let pill: CGFloat = 999
    }

    enum Shadow {
        static let softRadius: CGFloat = 8
        static let mediumRadius: CGFloat = 14
        static let ySmall: CGFloat = 3
        static let yMedium: CGFloat = 6
        static let opacity: CGFloat = 0.20
    }

    enum Opacity {
        static let pressed: CGFloat = 0.88
        static let disabled: CGFloat = 0.45
        static let subtle: CGFloat = 0.72
    }

    enum Motion {
        static let quick = Animation.easeOut(duration: 0.16)
        static let transition = Animation.spring(response: 0.28, dampingFraction: 0.86)
        static let transitionReduced = Animation.easeOut(duration: 0.14)
        static let breathing = Animation.easeInOut(duration: 2.0).repeatForever(autoreverses: true)
        static let breathingReduced = Animation.easeInOut(duration: 2.8).repeatForever(autoreverses: true)
    }

    enum Typography {
        static func title(compact: Bool) -> Font {
            compact ? Font.system(.subheadline, design: .rounded).weight(.semibold)
                    : Font.system(.headline, design: .rounded).weight(.semibold)
        }

        static func subtitle(compact: Bool) -> Font {
            compact ? Font.system(size: 10, weight: .regular, design: .rounded)
                    : Font.system(.caption2, design: .rounded)
        }

        static func body(compact: Bool) -> Font {
            compact ? Font.system(.footnote, design: .rounded)
                    : Font.system(.body, design: .rounded)
        }

        static func button(compact: Bool) -> Font {
            compact ? Font.system(.footnote, design: .rounded).weight(.semibold)
                    : Font.system(.callout, design: .rounded).weight(.semibold)
        }

        static func metric(compact: Bool) -> Font {
            compact ? Font.system(.title3, design: .rounded).weight(.semibold)
                    : Font.system(.title2, design: .rounded).weight(.semibold)
        }
    }

    static var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [ColorToken.backgroundTop, ColorToken.backgroundBottom],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
