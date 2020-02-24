//
//  HousesTableViewCell.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 19/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class HousesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var words: UILabel!
    @IBOutlet weak var seat: UILabel!
    
    private var houses: Houses?
    var delegate: FavoriteDelegate?
    
    override func awakeFromNib() {
        imageName.layer.cornerRadius = 6
        imageName.layer.borderWidth = 1
        imageName.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
    }
    
    func setHouses (_ houses: Houses){
        self.houses = houses
        // llamamos al singleton y le preguntamos si esta en la lista
        
        let heartImageNamed = DataController.shared.isFavorite(houses) ? "heart.fill" : "heart" // preguntamos si esta, si esta coge heart fill y si no heart
        let heartImage = UIImage.init(systemName: heartImageNamed) // le decimos que heart image es lo que hemos guardado arriba
        self.heart.setImage(heartImage, for: .normal) // seteamos la imagen
        self.imageName.image = UIImage.init(named: houses.imageName ?? "")
        self.name.text = houses.name
        self.words.text = houses.words
        self.seat.text = houses.seat
    }
    
    // MARK: IBActions
    
    
    @IBAction func favoriteAction(_ sender: Any) {
        if let houses = self.houses{
            if DataController.shared.isFavorite(houses) {
                DataController.shared.removeFavorite(houses)
            } else {
                DataController.shared.addFavorite(houses)
            }
            delegate?.didFavoriteChanged()
        }
    }
}

