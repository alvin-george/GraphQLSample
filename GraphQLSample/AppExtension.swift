//
//  AppExtension.swift
//  GraphQLSample
//
//  Created by apple on 27/06/17.
//  Copyright © 2017 apple. All rights reserved.
//

import Foundation


extension String {
    func trimString() -> String {
        var trimmedStr: String = ""
        var str_Trimmed: String = (self as NSString).replacingCharacters(in: (self as NSString).range(of:"^\\s*", options: .regularExpression), with: "")
        if str_Trimmed.characters.count > 0 {
            trimmedStr = (str_Trimmed as NSString).replacingCharacters(in: (str_Trimmed as NSString).range(of:"\\s*$", options: .regularExpression), with: "")
        }
        return trimmedStr
    }
}

extension Character
{
    func unicodeScalar() -> UnicodeScalar
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return scalars[scalars.startIndex]
    }
}
