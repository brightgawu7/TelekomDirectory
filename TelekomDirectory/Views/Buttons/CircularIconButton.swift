import SwiftUI

struct CircularIconButton: View {
    var systemIconName: String

    var backgroundColor: Color = .init(.purpleRed)

    var iconColor: Color = .init(.defaultWhite)

    var isButtonDisabled: Bool = false

    var action: (() -> Void)?

    var body: some View {
        Button(action: {
            action?()
        }, label: {
            Image(systemName: systemIconName)
                .font(.title2)
                .foregroundColor(iconColor)
                .padding(10)
                .background(isButtonDisabled ? Color(.surfaceDisabled) : backgroundColor)
                .clipShape(Circle())
        })
        .disabled(isButtonDisabled)
    }
}

#Preview {
    BackgroundViewWrapper {
        CircularIconButton(
            systemIconName: "arrow.2.circlepath.circle",
            backgroundColor: .init(.defaultWhiteBackground),
            iconColor: .black,
            action: {
                print("Button pressed!")
            }
        )
    }
}
