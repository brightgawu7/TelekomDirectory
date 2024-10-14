/**
 A view that displays a magnifying glass icon for search functionality.
 */

import SwiftUI
import SwiftUICore

struct SearchIcon: View {
    var size: Font = .title3

    var body: some View {
        Image(systemName: "magnifyingglass").foregroundStyle(.defaultText)
            .font(size)
    }
}

#Preview {
    BackgroundViewWrapper {
        SearchIcon()
    }
}
