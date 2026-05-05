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
                        .frame(height: AppTheme.Layout.topHeight(compact: compact))

                    hero
                        .frame(height: AppTheme.Layout.heroHeight(compact: compact))

                    content
                        .frame(maxHeight: AppTheme.Layout.contentMaxHeight(compact: compact))

                    actions
                        .frame(maxHeight: AppTheme.Layout.actionsMaxHeight(compact: compact))
                }
                .padding(.horizontal, AppTheme.Spacing.horizontal(compact: compact))
                .padding(.top, AppTheme.Spacing.topInset(compact: compact))
                .padding(.bottom, AppTheme.Spacing.bottomInset(compact: compact))
            }
        }
    }
}
