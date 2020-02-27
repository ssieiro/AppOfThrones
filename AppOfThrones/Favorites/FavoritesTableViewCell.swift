//
//  FavoritesTableViewCell.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
    
//    MARK: IBOUTLET
    
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    
    private var episode: Episode?
    
    override func awakeFromNib() {
        thumb.layer.cornerRadius = 2.0
        thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        thumb.layer.borderWidth = 1.0
    }
    
    func setEpisodes (_ episode: Episode) {
        self.thumb.image = UIImage.init(named: episode.image ?? "")
        self.name.text = episode.name
        self.date.text = episode.date
    }
    
    
}
