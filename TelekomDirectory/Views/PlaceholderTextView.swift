
import SwiftUI

struct PlaceholderTextView: View {
    var placeholderText: String = "Search for contact information of employees."

    var body: some View {
        Text(placeholderText)
            .font(.subheadline)
            .foregroundStyle(Color(.textDarkLight))
    }
}

#Preview {
    PlaceholderTextView()
}
