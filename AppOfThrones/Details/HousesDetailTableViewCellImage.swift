//
//  HousesDetailTableViewCellImage.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class HousesDetailTableViewCellImage: UITableViewCell {
    

    @IBOutlet weak var houseImage: UIImageView!
    
    override func awakeFromNib() {
        houseImage.layer.cornerRadius = 8
        houseImage.layer.borderColor  = UIColor.white.withAlphaComponent(0.2).cgColor
        houseImage.layer.borderWidth  = 1.0
    }
    
    func setImage (_ house: Houses) {
        self.houseImage.image = UIImage.init(named: house.imageName ?? "")
    }
}
