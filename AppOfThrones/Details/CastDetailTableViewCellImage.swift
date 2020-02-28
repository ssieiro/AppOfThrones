//
//  CastDetailTableViewCell.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class CastDetailTableViewCellImage: UITableViewCell {
    

    @IBOutlet weak var imagen: UIImageView!
    
    override func awakeFromNib() {
        imagen.layer.cornerRadius = 8
        imagen.layer.borderColor  = UIColor.white.withAlphaComponent(0.2).cgColor
        imagen.layer.borderWidth  = 1.0
    }
    
    func setImage (_ cast: Cast) {
       self.imagen.image = UIImage.init(named: cast.avatar ?? "")
    }
}
