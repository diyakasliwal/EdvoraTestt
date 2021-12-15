//
//  ValidationProtocol.swift
//  EdvoraTest
//
//  Created by Diya Kasliwal on 14/12/21.
//

import Foundation

protocol ValidationProtocol {

   
    var validationString: String? { get }

    func validateUsername() -> Bool

    func validatePassword() -> Bool

    func validateEmail() -> Bool
}

