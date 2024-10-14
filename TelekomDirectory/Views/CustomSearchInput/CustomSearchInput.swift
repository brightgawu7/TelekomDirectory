import SwiftUI

struct CustomSearchInput: View {
    @Binding var text: String

    @FocusState private var isFocused: Bool

    var body: some View {
        HStack(spacing: 15) {
            SearchIcon()

            TextField("Search", text: $text)
                .font(.title3)
                .foregroundStyle(Color(.defaultText))
                .keyboardType(.emailAddress)
                .focused($isFocused)

            ClearButton(isVisible: !text.isEmpty) {
                text = ""
                isFocused = false
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.grayDarkLight))
        .cornerRadius(30)
    }
}

#Preview {
    BackgroundViewWrapper {
        CustomSearchInput(text: .constant(""))
            .padding(.horizontal)
    }
}
