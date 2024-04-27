//
//  UIApplication.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/13/24.
//

import SwiftUI

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
