//
//  House.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 19/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import Foundation

struct Houses: Identifiable, Codable, CustomStringConvertible, Equatable {
 
    static func == (lhs: Houses, rhs: Houses) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    var description: String {
        return "Esta es la casa \(self.name ?? "con el id\(self.id)")"
    }
    
    var id: Int
    var imageName: String? // emblema
    var name: String? // nombre de la casa
    var words: String? // lema
    var seat: String? // areas por las que se mueven las casas, mirar en la wiki
    
    init(id: Int, imageName: String?, name: String?, words: String?, seat: String?) {
        self.id = id
        self.imageName = imageName
        self.name = name
        self.words = words
        self.seat = seat
    }
}
