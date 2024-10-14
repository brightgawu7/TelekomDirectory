import UIKit

enum EmailSendingHelper {
 
    static func sendEmail(to emailAddress: String?) {
        guard let emailAddress = emailAddress, !emailAddress.isEmpty else {
            return
        }

        guard let emailURL = URL(string: "mailto:\(emailAddress)"),
              UIApplication.shared.canOpenURL(emailURL)
        else {
            print("Invalid email address or unable to open email client")
            return
        }

        UIApplication.shared.open(emailURL)
    }
}
