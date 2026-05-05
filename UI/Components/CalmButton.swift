import SwiftUI

enum CalmButtonTone {
    case primary
    case secondary
    case ghost

    var fill: Color {
        switch self {
        case .primary: return AppTheme.ColorToken.neutralGray
        case .secondary: return AppTheme.ColorToken.surface
        case .ghost: return .clear
        }
    }

    var text: Color {
        switch self {
        case .ghost: return AppTheme.ColorToken.textSecondary
        default: return AppTheme.ColorToken.textPrimary
        }
    }
}

struct CalmButton: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) private var highLegibility

    let title: String
    let tone: CalmButtonTone
    var hint: String? = nil
    let action: () -> Void

    var body: some View {
        GeometryReader { geo in
            let compact = geo.size.height < 212
            Button(action: action) {
                Text(title)
                    .font(AppTheme.Typography.button(compact: compact))
                    .foregroundStyle(highLegibility ? AppTheme.ColorToken.textPrimary : tone.text)
                    .frame(maxWidth: .infinity)
                    .frame(minHeight: compact ? 30 : 32)
                    .padding(.vertical, AppTheme.Spacing.xxs)
                    .background(tone.fill)
                    .overlay {
                        if tone != .ghost {
                            RoundedRectangle(cornerRadius: AppTheme.Radius.sm, style: .continuous)
                                .stroke(AppTheme.ColorToken.border, lineWidth: 0.8)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: AppTheme.Radius.sm, style: .continuous))
            }
            .buttonStyle(PressFeedbackStyle())
            .accessibilityLabel(Text(title))
            .accessibilityHint(Text(hint ?? "Action"))
        }
        .frame(height: 36)
    }
}
