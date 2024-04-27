//
//  Optional.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/13/24.
//

import Foundation

extension Optional where Wrapped == String{
    var stringValue: String{
        guard let self = self else {
            return ""
        }
        return self
    }
}


/*
    var name: String?
    print(name.stringValue)
 */
