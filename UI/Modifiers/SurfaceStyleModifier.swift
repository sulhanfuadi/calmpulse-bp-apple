import SwiftUI

struct SurfaceStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(AppTheme.ColorToken.surface)
            .overlay {
                RoundedRectangle(cornerRadius: AppTheme.Radius.md, style: .continuous)
                    .stroke(AppTheme.ColorToken.border, lineWidth: 1)
            }
            .clipShape(RoundedRectangle(cornerRadius: AppTheme.Radius.md, style: .continuous))
    }
}

extension View {
    func calmSurface() -> some View {
        modifier(SurfaceStyleModifier())
    }
}
