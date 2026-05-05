import SwiftUI

struct CalmCard<Content: View>: View {
    enum Variant {
        case compact
        case standard
        case elevated
    }

    var variant: Variant = .standard
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.sm) {
            content
        }
        .padding(variant == .compact ? AppTheme.Spacing.sm : AppTheme.Spacing.md)
        .calmSurface(level: variant == .elevated ? 3 : 2, elevated: variant == .elevated)
    }
}
