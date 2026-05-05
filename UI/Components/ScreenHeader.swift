import SwiftUI

struct ScreenHeader: View {
    let title: String
    let subtitle: String?
    var trailingMeta: String? = nil

    var body: some View {
        VStack(spacing: AppTheme.Spacing.xs) {
            if let trailingMeta {
                Text(trailingMeta)
                    .font(AppTheme.Typography.subtitle)
                    .foregroundStyle(AppTheme.ColorToken.textTertiary)
            }

            Text(title)
                .font(AppTheme.Typography.title)
                .foregroundStyle(AppTheme.ColorToken.textPrimary)
                .multilineTextAlignment(.center)

            if let subtitle {
                Text(subtitle)
                    .font(AppTheme.Typography.subtitle)
                    .foregroundStyle(AppTheme.ColorToken.textSecondary)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
