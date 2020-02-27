//
//  EpisodeDetailViewController.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var imagen = "imagen"
    var info = "info"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    convenience init(title: String) {
        self.init(nibName: "EpisodeDetailViewController", bundle: nil)
        self.title = title
    }
    
    func setupUI() {
        let nibImage = UINib.init(nibName: "EpisodeDetailTableViewCellImage", bundle: nil)
        tableView.register(nibImage, forCellReuseIdentifier: "EpisodeDetailTableViewCellImage")
        let nibInfo = UINib.init(nibName: "EpisodeDetailTableViewCellInfo", bundle: nil)
        tableView.register(nibInfo, forCellReuseIdentifier: "EpisodeDetailTableViewCellInfo")
        
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
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeDetailTableViewCellImage", for: indexPath) as? EpisodeDetailTableViewCellImage {
            let name = imagen
            cell.setImage(name)
            return cell
        }
    } else {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeDetailTableViewCellInfo", for: indexPath) as? EpisodeDetailTableViewCellInfo {
            let name = info
            cell.setInfo(name)
            return cell
        }
        
    }
    fatalError("Could not create cells")
}
}
