import SwiftUI

struct StatusChip: View {
    let title: String
    var tone: Color = AppTheme.ColorToken.accentSecondary

    var body: some View {
        Text(title)
            .font(AppTheme.Typography.subtitle.weight(.semibold))
            .foregroundStyle(AppTheme.ColorToken.textPrimary)
            .padding(.horizontal, AppTheme.Spacing.sm)
            .padding(.vertical, AppTheme.Spacing.xxs)
            .background(tone.opacity(0.25))
            .overlay {
                Capsule().stroke(tone.opacity(0.55), lineWidth: 1)
            }
            .clipShape(Capsule())
    }
}
