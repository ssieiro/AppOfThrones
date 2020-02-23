//
//  castTableViewCell.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 18/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit


class CastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var episodes: UILabel!
    @IBOutlet weak var role: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    //delegado del cast, pasa el actor y crea la variable que puede contener cualquier clase que conforme el protocolo
    private var cast: Cast?
    var delegate: FavoriteDelegate?
    
    override func awakeFromNib() {
        avatar.layer.cornerRadius = 8
        avatar.layer.borderWidth = 1.0
        avatar.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
    }
        func setCast (_ cast: Cast) {
            self.cast = cast
            // llamamos al singleton y le preguntamos si esta en la lista
            
            let heartImageNamed = DataController.shared.isFavorite(cast) ? "heart.fill" : "heart" // preguntamos si esta, si esta coge heart fill y si no heart
            let heartImage = UIImage.init(systemName: heartImageNamed) // le decimos que heart image es lo que hemos guardado arriba
            self.heart.setImage(heartImage, for: .normal) // seteamos la imagen
            self.episodes.text = "\(cast.episodes ?? 0) episodes"
            self.role.text = cast.role
            self.name.text = cast.fullname
            self.avatar.image = UIImage.init(named: cast.avatar ?? "")
        }
    
    //MARK: IBActions
    
    @IBAction func favoriteAction(_ sender: Any) {
        //preguntamos si existe el actor porque es opcional
        if let cast = self.cast{
            if DataController.shared.isFavorite(cast) {
                DataController.shared.removeFavorite(cast)
            } else {
                DataController.shared.addFavorite(cast)
            }
            delegate?.didFavoriteChanged()
        }
    }
}
