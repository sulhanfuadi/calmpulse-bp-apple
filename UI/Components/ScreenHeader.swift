import SwiftUI

struct ScreenHeader: View {
    let title: String
    let subtitle: String?

    var body: some View {
        GeometryReader { geo in
            let compact = geo.size.height < 212
            VStack(spacing: AppTheme.Spacing.xxs) {
                Text(title)
                    .font(AppTheme.Typography.title(compact: compact))
                    .foregroundStyle(AppTheme.ColorToken.textPrimary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)

                if let subtitle {
                    Text(subtitle)
                        .font(AppTheme.Typography.subtitle(compact: compact))
                        .foregroundStyle(AppTheme.ColorToken.textSecondary)
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
