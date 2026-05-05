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
            .font(AppTheme.Typography.subtitle(compact: true))
            .foregroundStyle(AppTheme.ColorToken.textMuted)
            .frame(maxWidth: .infinity, alignment: .center)
            .opacity(0.9)
    }
}
