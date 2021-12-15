//
//  String+Extension.swift
//  EdvoraTest
//
//  Created by Diya Kasliwal on 14/12/21.
//

import Foundation

extension String  {

   
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }

    
    func trimWhiteSpace() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
}
