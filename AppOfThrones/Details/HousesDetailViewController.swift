//
//  HousesDetailViewController.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class HousesDetailViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var imagen = "imagen"
    var info = "info"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    convenience init(title: String) {
        self.init(nibName: "HousesDetailViewController", bundle: nil)
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
                let name = imagen
                cell.setImage(name)
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "HousesDetailTableViewCellInfo", for: indexPath) as? HousesDetailTableViewCellInfo {
                let name = info
                cell.setInfo(name)
                return cell
            }
            
        }
        fatalError("Could not create cells")
    }
}
