import SwiftUI

enum StatusTone {
    case neutral
    case success
    case danger

    var color: Color {
        switch self {
        case .neutral: return AppTheme.ColorToken.neutralGray
        case .success: return AppTheme.ColorToken.successGreen
        case .danger: return AppTheme.ColorToken.dangerRed
        }
    }
}

struct StatusChip: View {
    let title: String
    var tone: StatusTone = .neutral

    var body: some View {
        Text(title)
            .font(AppTheme.Typography.subtitle(compact: true).weight(.semibold))
            .foregroundStyle(AppTheme.ColorToken.textPrimary)
            .padding(.horizontal, AppTheme.Spacing.sm)
            .padding(.vertical, AppTheme.Spacing.xxs)
            .background(tone.color.opacity(0.26))
            .overlay {
                Capsule().stroke(tone.color.opacity(0.8), lineWidth: 1)
            }
            .clipShape(Capsule())
            .frame(maxWidth: .infinity, alignment: .center)
    }
}
