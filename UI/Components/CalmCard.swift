import SwiftUI

struct CalmCard<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.sm) {
            content
        }
        .padding(AppTheme.Spacing.md)
        .background(AppTheme.ColorToken.card)
        .overlay {
            RoundedRectangle(cornerRadius: AppTheme.Radius.md, style: .continuous)
                .stroke(AppTheme.ColorToken.cardStroke, lineWidth: 1)
        }
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.Radius.md, style: .continuous))
        .shadow(color: .black.opacity(AppTheme.Shadow.opacity), radius: AppTheme.Shadow.cardRadius, y: AppTheme.Shadow.cardY)
    }
}
