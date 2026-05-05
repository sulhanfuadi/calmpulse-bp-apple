import SwiftUI

struct StatusChip: View {
    enum Tone {
        case accent
        case success
        case warning

        var color: Color {
            switch self {
            case .accent: return AppTheme.ColorToken.accentSoft
            case .success: return AppTheme.ColorToken.success
            case .warning: return AppTheme.ColorToken.warning
            }
        }
    }

    let title: String
    var tone: Tone = .accent

    var body: some View {
        Text(title)
            .font(AppTheme.Typography.subtitle(compact: false).weight(.semibold))
            .foregroundStyle(AppTheme.ColorToken.textPrimary)
            .padding(.horizontal, AppTheme.Spacing.sm)
            .padding(.vertical, AppTheme.Spacing.xxs)
            .background(tone.color.opacity(0.20))
            .overlay {
                Capsule().stroke(tone.color.opacity(0.58), lineWidth: 1)
            }
            .clipShape(Capsule())
    }
}
