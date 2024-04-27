//
//  MovieCardType.swift
//  Flick Reflector
//
//  Created by csuftitan on 4/15/24.
//

import Foundation

enum MovieCardType{
    case poster, grid
}

extension MovieCardType{
    var widthPercent: Double {
        switch self{
        case .poster:
            return  0.65
        case .grid:
            return 0.30
        }
    }
    
    var heightPercent: Double{
        switch self{
        case .poster:
            return 0.40
        case .grid:
            return 0.20
        }
    }
}
