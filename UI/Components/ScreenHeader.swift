import SwiftUI

struct ScreenHeader: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) private var highLegibility

    let title: String
    let subtitle: String?
    var trailingMeta: String? = nil

    var body: some View {
        GeometryReader { geo in
            let compact = geo.size.height < 210
            VStack(spacing: AppTheme.Spacing.xs) {
                if let trailingMeta {
                    Text(trailingMeta)
                        .font(AppTheme.Typography.subtitle(compact: compact))
                        .foregroundStyle(highLegibility ? AppTheme.ColorToken.textSecondaryHighLegibility : AppTheme.ColorToken.textTertiary)
                }

                Text(title)
                    .font(AppTheme.Typography.title(compact: compact))
                    .foregroundStyle(AppTheme.ColorToken.textPrimaryHighLegibility)
                    .multilineTextAlignment(.center)

                if let subtitle {
                    Text(subtitle)
                        .font(AppTheme.Typography.subtitle(compact: compact))
                        .foregroundStyle(highLegibility ? AppTheme.ColorToken.textSecondaryHighLegibility : AppTheme.ColorToken.textSecondary)
                        .multilineTextAlignment(.center)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 58)
    }
}
