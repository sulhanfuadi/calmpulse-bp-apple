import SwiftUI

struct CalmPrimaryButton: View {
    let title: String
    var isEnabled: Bool = true
    var accessibilityHint: String? = nil
    let action: () -> Void

    var body: some View {
        GeometryReader { geo in
            let compact = geo.size.height < 210
            Button(action: action) {
                Text(title)
                    .font(AppTheme.Typography.button(compact: compact))
                    .foregroundStyle(AppTheme.ColorToken.base)
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 40)
                    .padding(.vertical, AppTheme.Spacing.xs)
                    .background(AppTheme.ColorToken.accent)
                    .clipShape(RoundedRectangle(cornerRadius: AppTheme.Radius.md, style: .continuous))
            }
            .buttonStyle(PressFeedbackStyle())
            .disabled(!isEnabled)
            .opacity(isEnabled ? 1 : AppTheme.Opacity.disabled)
            .accessibilityLabel(Text(title))
            .accessibilityHint(Text(accessibilityHint ?? "Aksi utama untuk layar ini"))
        }
        .frame(height: 52)
    }
}

struct CalmSecondaryButton: View {
    let title: String
    var isEnabled: Bool = true
    var accessibilityHint: String? = nil
    let action: () -> Void

    var body: some View {
        GeometryReader { geo in
            let compact = geo.size.height < 210
            Button(action: action) {
                Text(title)
                    .font(AppTheme.Typography.subtitle(compact: compact).weight(.semibold))
                    .foregroundStyle(AppTheme.ColorToken.textPrimary)
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 40)
                    .padding(.vertical, AppTheme.Spacing.xs)
                    .calmSurface(level: 2)
            }
            .buttonStyle(PressFeedbackStyle())
            .disabled(!isEnabled)
            .opacity(isEnabled ? 1 : AppTheme.Opacity.disabled)
            .accessibilityLabel(Text(title))
            .accessibilityHint(Text(accessibilityHint ?? "Aksi tambahan"))
        }
        .frame(height: 52)
    }
}

struct CalmGhostButton: View {
    let title: String
    var accessibilityHint: String? = nil
    let action: () -> Void

    var body: some View {
        GeometryReader { geo in
            let compact = geo.size.height < 210
            Button(action: action) {
                Text(title)
                    .font(AppTheme.Typography.subtitle(compact: compact).weight(.semibold))
                    .foregroundStyle(AppTheme.ColorToken.textSecondary)
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: 36)
                    .padding(.vertical, AppTheme.Spacing.xxs)
            }
            .buttonStyle(PressFeedbackStyle())
            .accessibilityLabel(Text(title))
            .accessibilityHint(Text(accessibilityHint ?? "Aksi opsi rendah prioritas"))
        }
        .frame(height: 46)
    }
}
