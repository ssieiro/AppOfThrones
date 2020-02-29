//
//  EpisodeDetailTableViewCellInfo.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class EpisodeDetailTableViewCellInfo: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    func setInfo (_ episode: Episode) {
        self.title.text = episode.name
        self.episodeNumber.text = "Episodio \(episode.episode) temporada \(episode.season)"
        self.date.text = episode.date
        self.overview.text = episode.overview

    }
}
