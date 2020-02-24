//
//  Cast.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 18/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import Foundation

struct Cast: Identifiable, Codable, CustomStringConvertible, Equatable {
    
     static func == (lhs: Cast, rhs: Cast) -> Bool {
         return lhs.id == rhs.id
     }
    
    var id: Int
    var avatar: String?
    var fullname: String?
    var role: String?
    var episodes: Int?
    var birth: String?
    var placeBirth: String?
    var description: String
    
    init(id: Int, avatar: String?, fullname: String?, role: String?, episodes: Int?, birth: String?, placeBirth: String?, description: String) {
        self.id = id
        self.avatar = avatar
        self.fullname = fullname
        self.role = role
        self.episodes = episodes
        self.birth = birth
        self.placeBirth = placeBirth
        self.description = "Este actor tiene el id \(id)"
    }
}
