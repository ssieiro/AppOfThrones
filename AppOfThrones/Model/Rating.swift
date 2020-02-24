//
//  Rating.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 21/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import Foundation

enum Rate {
    case unrated
    case rated(value: Double)
}

struct Rating: CustomStringConvertible, Equatable {
    
    static func == (lhs: Rating, rhs: Rating) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    var description: String
    var id: Int
    var rate: Rate
    
    init(id: Int, rate: Rate, description: String) {
        self.id = id
        self.rate = rate
        self.description = "Esta es la valoración con id \(self.id)"
    }
}
