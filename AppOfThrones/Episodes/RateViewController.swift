//
//  RateViewController.swift
//  AppOfThrones
//
//  Created by Fernando Torcelly Garcia on 09/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit



class RateViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var star01: UIImageView!
    @IBOutlet weak var star02: UIImageView!
    @IBOutlet weak var star03: UIImageView!
    @IBOutlet weak var star04: UIImageView!
    @IBOutlet weak var star05: UIImageView!
    @IBOutlet weak var rateSlider: UISlider!
    
    
    private var episode: Episode?
    var delegate: RateTableViewControllerDelegate? // aquí se guarda cualquier objeto que conforme el protocolo
    convenience init(withEpisode episode: Episode) {
        self.init()
        self.episode = episode
        self.title = episode.name
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 4.0
    }
    
    // MARK: IBActions
    
    @IBAction func sliderFire(_ sender: UISlider) {
        let rate = Double(Int(rateSlider.value * 5)/10)
        self.setRating(rate)
        
    } 
    
    @IBAction func confirm(_ sender: Any) {
        let rate = Double(Int(rateSlider.value * 5)/10)
        if let episode = episode {
            DataController.shared.rateEpisode(episode, value: rate)
            self.dismiss(animated: true, completion: nil)
            //cuando le das al boton confirmar se cierra
        }
        self.delegate?.didRateChanged() // cuando confirma llama al delegado si existe y le dice que actualice
            
        }
       // DataController.shared.removeRateEpisode(episode)

    @IBAction func rateChanged(_ sender: UISlider) {
        let rate = Double(Int(sender.value * 5)/10)
        rateLabel.text = String(rate)
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


// MARK: - Rating

func setRating(_ rating: Double) {
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
