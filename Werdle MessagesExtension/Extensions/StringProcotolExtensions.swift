//
//  StringProcotolExtensions.swift
//  Werdle MessagesExtension
//
//  Created by Andrew Carvajal on 7/26/22.
//

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
