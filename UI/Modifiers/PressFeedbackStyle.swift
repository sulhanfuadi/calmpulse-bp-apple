import SwiftUI

struct PressFeedbackStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.97 : 1)
            .opacity(configuration.isPressed ? AppTheme.Opacity.pressed : 1)
            .animation(.easeOut(duration: 0.14), value: configuration.isPressed)
    }
}
