//
//  CastViewController.swift
//  AppOfThrones
//
//  Created by Fernando Torcelly Garcia on 09/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class CastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cast: [Cast] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData()
    }
    
    //: MARK: Setup
    
    func setupUI() {
        let nib = UINib.init(nibName: "CastTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CastTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
     }
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
        
    }
    
    func setupData() {
        if let pathURL = Bundle.main.url(forResource: "cast", withExtension: "json"){
            do {
            let data = try Data.init(contentsOf: pathURL)
            let decoder = JSONDecoder()
            cast = try decoder.decode([Cast].self, from: data)
            self.tableView.reloadData()
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("Could not build the path url")
        }
        
    }
        // MARK: FavoriteDelegate
        
    @objc func didFavoriteChanged() {
            self.tableView.reloadData()
        }
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let actor = cast[indexPath.row]
        let castDetailVC = CastDetailViewController.init(withCast: actor)
        self.navigationController?.pushViewController(castDetailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    // MARK: - UITableViewDatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CastTableViewCell", for: indexPath) as? CastTableViewCell {
            let actor = cast[indexPath.row]
            cell.setCast(actor)
            cell.delegate = self // le decimos que es el delegado
            return cell
        }
        fatalError("Could not create the Episode cell")
    }

}


