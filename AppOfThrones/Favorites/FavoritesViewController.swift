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
        self.setupData(1)
        self.setupNotifications ()
    }
    
    var episodes: [Episode] = []
    
    func setupUI() {
        self.title = "Favorites"
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    func setupData (_ seasonNumber: Int) {
        if let pathURL = Bundle.main.url(forResource: "season_\(seasonNumber)", withExtension: "json"){
            do {
            let data = try Data.init(contentsOf: pathURL)
            let decoder = JSONDecoder()
            episodes = try decoder.decode([Episode].self, from: data)
            self.updateFavorites()
            self.tableView.reloadData()
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("Could not build the path url")
        }
    }
    
    func setupNotifications () {
           let noteName = Notification.Name(rawValue: "DidFavoriteChanged")
           NotificationCenter.default.addObserver(self, selector: #selector(self.updateFavorites), name: noteName, object: nil)
           
       }
    @objc func updateFavorites() {
        for ep in episodes {
                if DataController.shared.isFavorite(ep) == false {
                    if let index = self.episodes.firstIndex(where: { (episodes) -> Bool in
                        return ep.id == episodes.id // te devuelve el primer número que cumpla la condicion, recorre rating buscando un id que sea igual al que le hemos enviado de episodio
                    }) {
                        self.episodes.remove(at: index) // si lo encuentra, lo borra
                    }
            self.tableView.reloadData()
        }
        }
    }

    
    
//    MARK: IBOUTLET
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var seasonSegmented: UISegmentedControl!
    
    @IBAction func seasonChanged(_ sender: UISegmentedControl) {
        let seasonNumber = sender.selectedSegmentIndex + 1
        self.setupData(seasonNumber)
    }
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = episodes[indexPath.row].name ?? ""
        let episodeDetailVC = EpisodeDetailViewController.init(title: name)
        self.navigationController?.pushViewController(episodeDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - UITableViewDatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            let ep = episodes[indexPath.row]
            cell.setEpisode(ep)
            return cell
        }
        fatalError("Could not create the Episode cell")
    }

}

