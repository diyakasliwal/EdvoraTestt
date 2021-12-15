//
//  Validations.swift
//  EdvoraTest
//
//  Created by Diya Kasliwal on 14/12/21.

//

import Foundation

enum ValidationType: Hashable {
    case username
    case password
    case email
}

struct Validations {

    var validationString: String?

    init(value: String?) {
        self.validationString = value
    }
}


extension Validations: ValidationProtocol {

    func validateUsername() -> Bool {
        guard let username = validationString else { return false }
        if username.count > 3 {
            return true
        }
        else {
            return false
        }
    }

   
    func validatePassword() -> Bool {
        guard let password = validationString else { return false }
        let passwordRegEx = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegEx)
        return passwordPredicate.evaluate(with: password)
    }


    func validateEmail() -> Bool {
        guard let email = validationString else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
}
