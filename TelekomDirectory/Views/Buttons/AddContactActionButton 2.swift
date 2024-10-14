import SwiftUI

struct AddContactActionButton: View {
    var employee: Employee

    var body: some View {
        CircularIconButton(
            systemIconName: "plus",
            backgroundColor: .init(.defaultWhite),
            iconColor: .init(.black),
            isButtonDisabled: false,
            action: {
            }
        )
    }
}

#Preview {
    BackgroundViewWrapper {
        AddContactActionButton(employee: mockEmployee)
    }
}
