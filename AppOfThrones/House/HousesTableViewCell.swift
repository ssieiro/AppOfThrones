//
//  HousesTableViewCell.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 19/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class HousesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var words: UILabel!
    @IBOutlet weak var seat: UILabel!
    
    override func awakeFromNib() {
        imageName.layer.cornerRadius = 6
        imageName.layer.borderWidth = 1
        imageName.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
    }
    
    func setHouses (_ houses: Houses){
        self.imageName.image = UIImage.init(named: houses.imageName ?? "")
        self.name.text = houses.name
        self.words.text = houses.words
        self.seat.text = houses.seat
    }
}

