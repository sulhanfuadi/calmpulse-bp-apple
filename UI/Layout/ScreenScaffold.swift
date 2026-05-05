import SwiftUI

struct ScreenScaffold<Top: View, Hero: View, Content: View, Actions: View>: View {
    @ViewBuilder let top: Top
    @ViewBuilder let hero: Hero
    @ViewBuilder let content: Content
    @ViewBuilder let actions: Actions

    var body: some View {
        GeometryReader { geo in
            let compact = geo.size.height < 212
            let stack = AppTheme.Spacing.stack(compact: compact)

            ZStack {
                AppTheme.background
                    .ignoresSafeArea()

                VStack(spacing: stack) {
                    top
                        .frame(height: compact ? 14 : 16)
                    hero
                        .frame(height: compact ? 38 : 42)
                    content
                        .frame(maxHeight: compact ? 62 : 72)
                    actions
                        .frame(maxHeight: compact ? 86 : 94)
                }
                .padding(.horizontal, AppTheme.Spacing.horizontal(compact: compact))
                .padding(.vertical, compact ? AppTheme.Spacing.xs : AppTheme.Spacing.sm)
            }
        }
    }
}
