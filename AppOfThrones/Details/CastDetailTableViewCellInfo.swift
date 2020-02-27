//
//  CastDetailTableViewCellInfo.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class CastDetailTableViewCellInfo: UITableViewCell {
    
    @IBOutlet weak var nombre: UILabel!
    
    func setInfo (_ info: String) {
        self.nombre.text = info
    }
}
