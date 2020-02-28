//
//  HousesDetailViewController.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class HousesDetailViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var house: Houses?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    convenience init(withHouse house: Houses ){
        self.init(nibName: "HousesDetailViewController", bundle: nil)
        self.house = house
        self.title = title
    }
    
    func setupUI() {
        let nibImage = UINib.init(nibName: "HousesDetailTableViewCellImage", bundle: nil)
        tableView.register(nibImage, forCellReuseIdentifier: "HousesDetailTableViewCellImage")
        let nibInfo = UINib.init(nibName: "HousesDetailTableViewCellInfo", bundle: nil)
        tableView.register(nibInfo, forCellReuseIdentifier: "HousesDetailTableViewCellInfo")
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
//    MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    
//    MARK: Delegate y DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HousesDetailTableViewCellImage", for: indexPath) as? HousesDetailTableViewCellImage {
                if let house = self.house {
                    cell.setImage(house)
                    return cell
                }
                fatalError("Error al crear Detail")
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HousesDetailTableViewCellInfo", for: indexPath) as? HousesDetailTableViewCellInfo {
                if let house = self.house {
                    cell.setInfo(house)
                    return cell
                }
                fatalError("Error al crear Detail")
            }
            
        }
        fatalError("Could not create cells")
    }
}
