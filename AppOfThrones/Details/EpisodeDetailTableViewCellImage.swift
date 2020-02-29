//
//  EpisodeDetailTableViewCellImage.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class EpisodeDetailTableViewCellImage: UITableViewCell {
    
    @IBOutlet weak var episodeImage: UIImageView!
    override func awakeFromNib() {
        episodeImage.layer.cornerRadius = 8
        episodeImage.layer.borderColor  = UIColor.white.withAlphaComponent(0.2).cgColor
        episodeImage.layer.borderWidth  = 1.0
    }
    func setImage (_ episode: Episode) {
        self.episodeImage.image = UIImage.init(named: episode.image ?? "")
    }
}
