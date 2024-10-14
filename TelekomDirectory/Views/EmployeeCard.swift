//
//  EmployeeCard.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/13/24.
//

import SwiftUI

struct EmployeeCard: View {
    var employee: Employee
    var searchText: String?

    var body: some View {
        HStack {
            PhotoAvatar(imageURL: URL(string: employee.image ?? ""))
            Spacer()
            VStack(alignment: .leading, spacing: 2) {
                Text(makeHighlightedText(fullText: employee.name, highlighted: searchText ?? ""))
                    .font(.title2)
                Text(employee.team.name)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .lineLimit(2)
            .foregroundStyle(.textDarkLight)

            Spacer()

            HStack(spacing: 5) {
                PhoneActionButton(phoneNumber: employee.phone)
                EmailActionButton(emailAddress: employee.email)
            }
        }
        .padding()
        .background(Color(.grayDarkLight))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .transition(.opacity.animation(.linear(duration: 0.3)))
    }
    
    
    func makeHighlightedText(fullText: String, highlighted: String) -> AttributedString {
        var attributedString = AttributedString(fullText)

        let lowercasedFullText = fullText.lowercased()
        let lowercasedHighlighted = highlighted.lowercased()

        if let range = lowercasedFullText.range(of: lowercasedHighlighted) {
            if let startIndex = attributedString.range(of: fullText[range.lowerBound ..< range.upperBound]) {
                attributedString[startIndex].foregroundColor = .defaultText
                attributedString[startIndex].font = .boldSystemFont(ofSize: 18)
            }
        }

        return attributedString
    }
}

#Preview {
    BackgroundViewWrapper {
        EmployeeCard(employee: mockEmployee, searchText: "John")
            .padding()
    }
}
