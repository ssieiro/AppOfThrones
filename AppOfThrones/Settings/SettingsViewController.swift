//
//  SettingsViewController.swift
//  AppOfThrones
//
//  Created by Fernando Torcelly Garcia on 09/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    //MARK: IBAction
    
    @IBAction func cleanFavoritesAction(_ sender: Any) {
        DataController.shared.cleanFavorite()
        // Actualizar todas las tablas donde aparezcan los favoritos, notification center
        
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.post(name: noteName, object: nil)
    }
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }

    // MARK: - Setup
    
    func setupUI() {
        self.title = "Settings"
    }
    
}
