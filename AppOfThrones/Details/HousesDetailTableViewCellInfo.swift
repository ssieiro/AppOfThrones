//
//  HousesDetailTableViewCellInfo.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class HousesDetailTableViewCellInfo: UITableViewCell {
    
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var words: UILabel!
    @IBOutlet weak var seat: UILabel!
    
    func setInfo (_ house: Houses) {
        self.houseName.text = house.name
        self.words.text = house.words
        self.seat.text = house.seat
    }
}
