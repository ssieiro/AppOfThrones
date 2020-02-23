//
//  HouseViewController.swift
//  AppOfThrones
//
//  Created by Fernando Torcelly Garcia on 09/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class HousesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    let houses: [Houses] = [Houses.init(imageName: "Stark", name: "Stark", words: " 'Winter is Coming.' ", seat: "Winterfell"), Houses.init(imageName: "Targaryen", name: "Targaryen", words: " 'Fire and Blood' ", seat: "Great Pyramid of Meereen, Aegonfort, Red Keep, Dragonstone, Summerhall"), Houses.init(imageName: "Tyrell", name: "Tyrell", words: " 'Growing Strong' ", seat: "Highgarden"), Houses.init(imageName: "Baratheon", name: "Baratheon", words: " 'Ours is the Fury' ", seat: "Storm's End, King's Landing, Dragonstone"), Houses.init(imageName: "Lannister", name: "Lannister", words: " 'Hear Me Roar!' ", seat: "Casterly Rock")]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: - Setup
    
    func setupUI() {
        self.title = "Houses"
        let nib = UINib.init(nibName: "HousesTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HousesTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: UITableViewDelegate
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
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
            return houses.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HousesTableViewCell", for: indexPath) as? HousesTableViewCell {
                let house = houses[indexPath.row]
                cell.setHouses(house)
                return cell
            }
            fatalError("Could not create the House cell")
        }
        
    }

