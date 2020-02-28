//
//  EvisodeTableViewCell.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 18/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit


//usamos un delegado para que actualice la tabla una vez damos una puntuacion

class EpisodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    
    var rateBlock: (() -> Void)? //una closure para poder presentar la celda en el episodeviewcontroller
    //método que se ejecuta justo cuando sale la celda, sirve para hacer esos tipos de operaciones que no puedo cambiar en la vista, como el corner radius
    private var episode: Episode?
    var delegate: FavoriteDelegate?
    override func awakeFromNib() {
        thumb.layer.cornerRadius = 2.0
        thumb.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        thumb.layer.borderWidth = 1.0
        rateButton.layer.cornerRadius = 10
    }
    //MARK: IBActions
    
    @IBAction func fireRate(_ sender: Any) {
        self.rateBlock?() 
    }
    
    @IBAction func fireFavorite(_ sender: Any) {
        if let episode = self.episode {
            if DataController.shared.isFavorite(episode) == false {
                DataController.shared.addFavorite(episode)
            } else {
                DataController.shared.removeFavorite(episode)
            }
            let noteName = Notification.Name(rawValue: "DidFavoriteChanged")
            NotificationCenter.default.post(name: noteName, object: nil)
            delegate?.didFavoriteChanged()
        }
    }
    // MARK: Set episode
    func setEpisode (_ episode: Episode) { //viene de la clase episodio ejemplo que ya teníamos
        
        self.episode = episode
        let heartImageNamed = DataController.shared.isFavorite(episode) ? "heart.fill" : "heart"
        let heartImage = UIImage.init(systemName: heartImageNamed)
        self.heart.setImage(heartImage, for: .normal)
        thumb.image = UIImage.init(named: episode.image ?? "")
        title.text = episode.name
        date.text = episode.date
        
        if let rating = DataController.shared.ratingForEpisode(episode) {
            switch rating.rate {
            case .rated(let value):
                self.setRating(value)
            case .unrated:
                self.modeRate()
            }
        } else {
            self.modeRate()
        }
    }
    
    //MARK: Rating
    
    func modeRate() {
        rateButton.isHidden = false
        star01.isHidden = true
        star02.isHidden = true
        star03.isHidden = true
        star04.isHidden = true
        star05.isHidden = true
    }
    func modeStar() {
        rateButton.isHidden = true
        star01.isHidden = false
        star02.isHidden = false
        star03.isHidden = false
        star04.isHidden = false
        star05.isHidden = false
    }
    
    func setRating(_ rating: Double) {
        self.modeStar()
        self.setStarImage(star01, rating: rating, minValue: 0)
        self.setStarImage(star02, rating: rating, minValue: 2)
        self.setStarImage(star03, rating: rating, minValue: 4)
        self.setStarImage(star04, rating: rating, minValue: 6)
        self.setStarImage(star05, rating: rating, minValue: 8)
    }

    private func setStarImage (_ imageView: UIImageView, rating: Double, minValue: Double) {
        if rating >= minValue + 1.0 && rating < minValue + 2.0 {
            imageView.image = UIImage.init(systemName: "star.lefthalf.fill")
        } else if rating >= minValue + 2.0 {
            imageView.image = UIImage.init(systemName: "star.fill")
        } else {
            imageView.image = UIImage.init(systemName: "star")
        }
    }

    
}
