import SwiftUI

struct PressFeedbackStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.975 : 1)
            .opacity(configuration.isPressed ? AppTheme.Opacity.pressed : 1)
            .animation(AppTheme.Motion.quick, value: configuration.isPressed)
    }
}
