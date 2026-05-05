import SwiftUI

struct SurfaceStyleModifier: ViewModifier {
    var level: Int = 1
    var elevated: Bool = false

    func body(content: Content) -> some View {
        let fill: Color = {
            switch level {
            case 2: return AppTheme.ColorToken.surface2
            case 3: return AppTheme.ColorToken.surface3
            default: return AppTheme.ColorToken.surface1
            }
        }()

        let radius: CGFloat = elevated ? AppTheme.Radius.lg : AppTheme.Radius.md

        content
            .background(fill)
            .overlay {
                RoundedRectangle(cornerRadius: radius, style: .continuous)
                    .stroke(level >= 2 ? AppTheme.ColorToken.strokeStrong : AppTheme.ColorToken.strokeSoft, lineWidth: 1)
            }
            .clipShape(RoundedRectangle(cornerRadius: radius, style: .continuous))
            .shadow(
                color: .black.opacity(elevated ? AppTheme.Shadow.opacity : AppTheme.Shadow.opacity * 0.6),
                radius: elevated ? AppTheme.Shadow.mediumRadius : AppTheme.Shadow.softRadius,
                y: elevated ? AppTheme.Shadow.yMedium : AppTheme.Shadow.ySmall
            )
    }
}

extension View {
    func calmSurface(level: Int = 1, elevated: Bool = false) -> some View {
        modifier(SurfaceStyleModifier(level: level, elevated: elevated))
    }
}
