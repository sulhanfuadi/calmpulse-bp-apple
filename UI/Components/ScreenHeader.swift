import SwiftUI

struct ScreenHeader: View {
    let title: String
    let subtitle: String?

    var body: some View {
        VStack(spacing: AppTheme.Spacing.xs) {
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
