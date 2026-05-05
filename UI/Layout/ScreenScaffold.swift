import SwiftUI

struct ScreenScaffold<Top: View, Hero: View, Content: View, Actions: View>: View {
    @ViewBuilder let top: Top
    @ViewBuilder let hero: Hero
    @ViewBuilder let content: Content
    @ViewBuilder let actions: Actions

    var body: some View {
        GeometryReader { geometry in
            let compact = geometry.size.height < 210

            ZStack {
                AppTheme.backgroundGradient
                    .ignoresSafeArea()

                VStack(spacing: compact ? AppTheme.Spacing.sm : AppTheme.Spacing.md) {
                    top
                    hero
                    content
                    Spacer(minLength: compact ? AppTheme.Spacing.xs : AppTheme.Spacing.sm)
                    actions
                }
                .padding(.horizontal, AppTheme.Spacing.md)
                .padding(.top, compact ? AppTheme.Spacing.sm : AppTheme.Spacing.md)
                .padding(.bottom, AppTheme.Spacing.sm)
            }
        }
    }
}
