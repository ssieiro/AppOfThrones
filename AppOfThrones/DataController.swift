//
//  DataController.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 19/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import Foundation

//patrón singleton, clase única a la que pueden acceder todos los VC pero solo puede haber una copia

protocol FavoriteDelegate {
    func didFavoriteChanged()
}

protocol RateTableViewControllerDelegate {
    func didRateChanged()
} // protocolo para tener un delegado, cuando doy un aviso llama a episodeviewcontroller para que refresque la vista

protocol Identifiable {
    var id: Int { get }
}

class DataController {
    
    static var shared = DataController() //creamos una instancia dentro de la clase a la que puedas acceder con el static (variable de clase a la que se puede llamar sin instanciar)
    // para llamarlo hariamos var whatever = DataController.shared
    private init() {} //evita que podamos instanciarlo por el private
    
    private var rating: [Rating] = [] // como controlamos el array desde dentro del data controller, ponemos la variable privada para que no se pueda acceder a ella y cambiarla
    private var favorite: [Int] = [] // array de enteros que guarda el id de los actores que le hemos dado favorito
    
    
    
    //MARK: Favorite Cast
    
    func cleanFavorite() {
        favorite = []
    }
    
    // MARK: Favorites
    
    func isFavorite<T: Identifiable>(_ value: T) -> Bool { // acepta como parámetro cualquier
        return favorite.contains(value.id)
    }
    
    func addFavorite<T: Identifiable> (_ value: T) {
        if self.isFavorite(value) == false {
            favorite.append(value.id)
        }
    }

    func removeFavorite<T: Identifiable>(_ value: T) {
        if let index = favorite.firstIndex(of: value.id) {
            favorite.remove(at: index)
        }
    }
    


    // MARK: Rating
    
    func cleanRating() {
        rating = []
    }
    
    func rateEpisode(_ episode: Episode, value: Double) {
        if self.ratingForEpisode(episode) == nil {
            let rateValue = Rating.init(id: episode.id, rate: Rate.rated(value: value), description: "Esta es la valoración con id \(episode.id)")
            rating.append(rateValue)
        }
    }
    
    func removeRateEpisode (_ episode: Episode) {
        if let index = self.rating.firstIndex(where: { (rating) -> Bool in
            return episode.id == rating.id // te devuelve el primer número que cumpla la condicion, recorre rating buscando un id que sea igual al que le hemos enviado de episodio
        }) {
            self.rating.remove(at: index) // si lo encuentra, lo borra
        }
    }
    
    func ratingForEpisode(_ episode: Episode) -> Rating? { //este filtro tiene que devolver true o false siempre
        let filtered = rating.filter {
            return $0.id == episode.id //devuelve true o false y guarda el valor si lo encuentra
        }
        return filtered.first //compara los id de rating con el id del episodio y si coincide te devuelve el primero
    }
}

    

