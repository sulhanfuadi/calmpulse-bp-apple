import SwiftUI

struct ScreenScaffold<Content: View>: View {
    @ViewBuilder let content: Content

    var body: some View {
        ZStack {
            AppTheme.backgroundGradient
                .ignoresSafeArea()

            VStack(spacing: AppTheme.Spacing.md) {
                content
            }
            .padding(AppTheme.Spacing.md)
        }
    }
}
