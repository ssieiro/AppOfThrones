//
//  CastDetailViewController.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class CastDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cast: Cast?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    convenience init(withCast cast: Cast) {
        self.init(nibName: "CastDetailViewController", bundle: nil)
        self.cast = cast
        self.title = title
    }
    
    func setupUI() {
        let nibImage = UINib.init(nibName: "CastDetailTableViewCellImage", bundle: nil)
        tableView.register(nibImage, forCellReuseIdentifier: "CastDetailTableViewCellImage")
        let nibInfo = UINib.init(nibName: "CastDetailTableViewCellInfo", bundle: nil)
        tableView.register(nibInfo, forCellReuseIdentifier: "CastDetailTableViewCellInfo")
        
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
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CastDetailTableViewCellImage", for: indexPath) as? CastDetailTableViewCellImage {
                if let cast = self.cast {
                    cell.setImage(cast)
                    return cell
                }
                fatalError("Error al crear Detail")
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CastDetailTableViewCellInfo", for: indexPath) as? CastDetailTableViewCellInfo {
                if let cast = self.cast {
                    cell.setInfo(cast)
                    return cell
                }
                fatalError("Error al crear Detail")
            }
            
        }
        fatalError("Could not create cells")
    }
    
}

