import UIKit

enum PhoneDialingHelper {

    static func dial(phoneNumber: String?) {
        guard let phoneNumber = phoneNumber, !phoneNumber.isEmpty else {
            return
        }

        let cleanedPhoneNumber = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)

        guard cleanedPhoneNumber.count >= 10 else {
            return
        }

        guard let phoneURL = URL(string: "tel://\(cleanedPhoneNumber)"),
              UIApplication.shared.canOpenURL(phoneURL)
        else {
            print("Invalid phone number or unable to open dialer")
            return
        }

        UIApplication.shared.open(phoneURL)
    }
}
