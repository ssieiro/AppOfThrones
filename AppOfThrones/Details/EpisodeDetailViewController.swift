//
//  EpisodeDetailViewController.swift
//  AppOfThrones
//
//  Created by Sonia Sieiro on 27/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    convenience init(title: String) {
        self.init(nibName: "EpisodeDetailViewController", bundle: nil)
        self.title = title
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    func setupUI() {
        
    }
}
