//
//  SearchContentLabel.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/13/24.
//

import SwiftUI

struct SearchContentLabel: View {
    var title: String

    var body: some View {
        Text(title)
                .font(.headline)
                .foregroundStyle(Color(.textDarkLight))
    }
}

#Preview {
    BackgroundViewWrapper {
        SearchContentLabel(title: "Contacts")
    }
}
