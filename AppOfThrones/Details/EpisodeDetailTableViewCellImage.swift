//
//  EpisodeDetailTableViewCellImage.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class EpisodeDetailTableViewCellImage: UITableViewCell {
    
    @IBOutlet weak var nombre: UILabel!
    
    func setImage (_ image: String) {
        self.nombre.text = image
    }
}
