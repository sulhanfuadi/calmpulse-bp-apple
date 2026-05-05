import SwiftUI

struct CalmPrimaryButton: View {
    let title: String
    var isEnabled: Bool = true
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppTheme.Typography.button)
                .foregroundStyle(AppTheme.ColorToken.base)
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppTheme.Spacing.sm)
                .background(AppTheme.ColorToken.accent)
                .clipShape(RoundedRectangle(cornerRadius: AppTheme.Radius.md, style: .continuous))
        }
        .buttonStyle(PressFeedbackStyle())
        .disabled(!isEnabled)
        .opacity(isEnabled ? 1 : AppTheme.Opacity.disabled)
    }
}

struct CalmSecondaryButton: View {
    let title: String
    var isEnabled: Bool = true
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppTheme.Typography.subtitle.weight(.semibold))
                .foregroundStyle(AppTheme.ColorToken.textPrimary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppTheme.Spacing.sm)
                .calmSurface(level: 2)
        }
        .buttonStyle(PressFeedbackStyle())
        .disabled(!isEnabled)
        .opacity(isEnabled ? 1 : AppTheme.Opacity.disabled)
    }
}

struct CalmGhostButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(AppTheme.Typography.subtitle.weight(.semibold))
                .foregroundStyle(AppTheme.ColorToken.textSecondary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppTheme.Spacing.xs)
        }
        .buttonStyle(PressFeedbackStyle())
    }
}
