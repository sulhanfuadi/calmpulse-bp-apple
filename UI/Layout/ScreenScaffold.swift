import SwiftUI

struct ScreenScaffold<Top: View, Hero: View, Content: View, Actions: View>: View {
    @ViewBuilder let top: Top
    @ViewBuilder let hero: Hero
    @ViewBuilder let content: Content
    @ViewBuilder let actions: Actions

    var body: some View {
        GeometryReader { geo in
            let compact = geo.size.height < 212

            ZStack {
                AppTheme.background
                    .ignoresSafeArea()

                VStack(spacing: AppTheme.Spacing.stack(compact: compact)) {
                    top
                        .frame(height: compact ? 12 : 14)

                    hero
                        .frame(height: compact ? 36 : 40)

                    content
                        .frame(maxHeight: compact ? 64 : 72)

                    actions
                        .frame(maxHeight: compact ? 84 : 92)
                }
                .padding(.horizontal, AppTheme.Spacing.horizontal(compact: compact))
                .padding(.top, compact ? AppTheme.Spacing.xs : AppTheme.Spacing.sm)
                .padding(.bottom, AppTheme.Spacing.xs)
            }
        }
    }
}
