//
//  FavoritesViewControllar.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    let episodes: [Episode] = [Episode.init(id: 10002, name: "Hola,Prueba", date: "15 enero prueba", image: "icjOgl5F9DhysOEo6Six2Qfwcu2", episode: 3, season: 2, overview: "Whatever"),Episode.init(id: 10002, name: "Hola,Prueba", date: "15 enero prueba", image: "icjOgl5F9DhysOEo6Six2Qfwcu2", episode: 3, season: 2, overview: "Whatever")]
    
    func setupUI() {
        self.title = "Favorites"
        let nib = UINib.init(nibName: "FavoritesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FavoritesTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
//    MARK: IBOUTLET
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // MARK: - UITableViewDatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as? FavoritesTableViewCell {
            let ep = episodes[indexPath.row]
            cell.setEpisodes(ep)
            return cell
        }
        fatalError("Could not create the Episode cell")
    }

}
