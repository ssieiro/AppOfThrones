//
//  CastDetailTableViewCell.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class CastDetailTableViewCellImage: UITableViewCell {
    

    @IBOutlet weak var castImage: UIImageView!
    
    override func awakeFromNib() {
        castImage.layer.cornerRadius = 8
        castImage.layer.borderColor  = UIColor.white.withAlphaComponent(0.2).cgColor
        castImage.layer.borderWidth  = 1.0
    }
    
    func setImage (_ cast: Cast) {
       self.castImage.image = UIImage.init(named: cast.avatar ?? "")
    }
}
