//
//  HouseViewController.swift
//  AppOfThrones
//
//  Created by Fernando Torcelly Garcia on 09/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class HousesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FavoriteDelegate {


    
    
    @IBOutlet weak var tableView: UITableView!
    var houses: [Houses] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications()
        self.setupData() // carga los datos
    }

    // MARK: - Setup
    
    func setupUI() {
        self.title = "Houses"
        let nib = UINib.init(nibName: "HousesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HousesTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupNotifications() {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
        
    }
    
    func setupData() {
        if let pathURL = Bundle.main.url(forResource: "houses", withExtension: "json"){
            do {
            let data = try Data.init(contentsOf: pathURL)
            let decoder = JSONDecoder()
            houses = try decoder.decode([Houses].self, from: data)
            self.tableView.reloadData()
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("Could not build the path url")
        }
        
    }
    
    // MARK: Favorite Delegate
    
    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
    }
    // MARK: UITableViewDelegate
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let name = houses[indexPath.row].name ?? ""
            let housesDetailVC = HousesDetailViewController.init(title: name)
            self.navigationController?.pushViewController(housesDetailVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
        
        // MARK: - UITableViewDatasource
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return houses.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HousesTableViewCell", for: indexPath) as? HousesTableViewCell {
                let house = houses[indexPath.row]
                cell.delegate = self
                cell.setHouses(house)
                return cell
            }
            fatalError("Could not create the House cell")
        }
        
    }

