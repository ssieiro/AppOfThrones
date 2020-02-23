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
    
    var cast: [Cast] = [Cast.init(id: 1, avatar: "Emilia Clarke", fullname: "Emilia Clarke", role: "Daenerys Targarien", episodes: 76, birth: "1986-10-23", placeBirth: "London, England, UK"), Cast.init(id: 2, avatar: "Kit Harington", fullname: "Kit Harington", role: "Jon Snow", episodes: 76, birth: "1986-12-20", placeBirth: "London, England, UK")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
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
        // MARK: FavoriteDelegate
        
    @objc func didFavoriteChanged() {
            self.tableView.reloadData()
        }
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 148
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Se ha hecho tap en la celda con sección \(indexPath.section) y la fila \(indexPath.row)")
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


