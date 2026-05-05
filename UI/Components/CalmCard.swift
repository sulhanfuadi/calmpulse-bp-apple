import SwiftUI

struct CalmCard<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: AppTheme.Spacing.xs) {
            content
        }
        .padding(AppTheme.Spacing.sm)
        .calmSurface()
    }
}
