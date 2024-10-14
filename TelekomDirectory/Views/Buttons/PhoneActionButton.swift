//
//  PhoneActionButton.swift
//  TelekomDirectory
//
//  Created by AMALITECH-PC-105889 on 10/13/24.
//

import SwiftUI

struct PhoneActionButton: View {
    var phoneNumber: String?

    var isButtonDisabled: Bool {
        phoneNumber?.isEmpty ?? true
    }

    var body: some View {
        CircularIconButton(
            systemIconName: "phone.fill",
            backgroundColor: .init(.purpleRed),
            iconColor: .init(.defaultWhite),
            isButtonDisabled: isButtonDisabled,
            action: {
                PhoneDialingHelper.dial(phoneNumber: phoneNumber)
            }
        )
    }
}

#Preview {
    BackgroundViewWrapper {
        VStack {
            PhoneActionButton(phoneNumber: "+1234567890")

            PhoneActionButton(phoneNumber: nil)
        }
    }
}
