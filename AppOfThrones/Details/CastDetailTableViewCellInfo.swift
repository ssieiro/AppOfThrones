//
//  CastDetailTableViewCellInfo.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class CastDetailTableViewCellInfo: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var birth: UILabel!
    @IBOutlet weak var placeBirth: UILabel!
    @IBOutlet weak var episodes: UILabel!
    
    
    func setInfo (_ cast: Cast) {
        self.name.text = cast.fullname
        self.role.text = cast.role
        self.birth.text = cast.birth
        self.placeBirth.text = cast.placeBirth
        self.episodes.text = "\(cast.episodes ?? 0) episodes"
    }
}
