import SwiftUI

enum AppTheme {
    enum ColorToken {
        static let bg = Color(red: 0.06, green: 0.08, blue: 0.13)
        static let bgSecondary = Color(red: 0.10, green: 0.12, blue: 0.18)
        static let card = Color.white.opacity(0.08)
        static let cardStroke = Color.white.opacity(0.14)
        static let textPrimary = Color.white
        static let textSecondary = Color.white.opacity(0.72)
        static let accent = Color(red: 0.40, green: 0.74, blue: 1.0)
        static let accentSecondary = Color(red: 0.38, green: 0.90, blue: 0.83)
        static let warning = Color(red: 1.0, green: 0.52, blue: 0.49)
    }

    enum Spacing {
        static let xxs: CGFloat = 4
        static let xs: CGFloat = 6
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
    }

    enum Radius {
        static let sm: CGFloat = 10
        static let md: CGFloat = 14
        static let pill: CGFloat = 999
    }

    enum Shadow {
        static let cardRadius: CGFloat = 8
        static let cardY: CGFloat = 4
        static let opacity: CGFloat = 0.20
    }

    enum Opacity {
        static let pressed: CGFloat = 0.86
        static let subtle: CGFloat = 0.72
    }

    enum Typography {
        static let title = Font.system(.headline, design: .rounded).weight(.semibold)
        static let subtitle = Font.system(.caption2, design: .rounded)
        static let body = Font.system(.body, design: .rounded)
        static let metric = Font.system(.title3, design: .rounded).weight(.semibold)
    }

    static var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [ColorToken.bg, ColorToken.bgSecondary],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
