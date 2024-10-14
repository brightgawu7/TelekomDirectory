//
//  RecentSearchCard.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/13/24.
//

import SwiftUI

struct RecentSearchCard: View {
    let searchItem: RecentSearchItem
    let clearAction: (() -> Void)?
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading) {
                HStack(spacing: 15) {
                    Image(systemName: "clock")

                    Text(searchItem.name)
                }
                Rectangle()
                    .frame(height: 1)
            }

            Spacer()

            Button(action: {
                clearAction?()
            }) {
                Image(systemName: "xmark")
            }
        }
        .font(.title3)
        .foregroundStyle(.defaultText)
        .multilineTextAlignment(.leading)
    }
}

#Preview {
    BackgroundViewWrapper {
        RecentSearchCard(searchItem: RecentSearchItem(id: UUID(), name: "Bright Edem Gawu"), clearAction: nil)
            .padding()
    }
}
