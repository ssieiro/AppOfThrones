//
//  EpisodeViewController.swift
//  AppOfThrones
//
//  Created by Fernando Torcelly Garcia on 09/02/2020.
//  Copyright © 2020 Fernando Torcelly Garcia. All rights reserved.
//

import UIKit

//delegate y data source son protocolos para poder controlar la tabla

class EpisodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RateTableViewControllerDelegate, FavoriteDelegate{

    
    @IBOutlet weak var seasonSegmented: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var episodes: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupNotifications ()
        self.setupData(1)
        
    }
/* ciclo de vida
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
*/
    // MARK: Setup
    
    func setupUI() {
        self.title = "Seasons"
        //crear referencia al xib de la celda para la tabla, nib = xib
        
        let nib = UINib.init(nibName: "EpisodeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "EpisodeTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupNotifications () {
        let noteName = Notification.Name(rawValue: "DidFavoritesUpdated")
        NotificationCenter.default.addObserver(self, selector: #selector(self.didFavoriteChanged), name: noteName, object: nil)
    }
    
    func setupData(_ seasonNumber: Int) {
        if let pathURL = Bundle.main.url(forResource: "season_\(seasonNumber)", withExtension: "json"){
            do {
            let data = try Data.init(contentsOf: pathURL)
            let decoder = JSONDecoder()
            episodes = try decoder.decode([Episode].self, from: data)
            self.tableView.reloadData()
            } catch {
                fatalError(error.localizedDescription)
            }
        } else {
            fatalError("Could not build the path url")
        }
        
    }
    
    // MARK: IBActions
    
    @IBAction func openRate(_ sender: Any) {
        //código para abrir pantalla rate
        let rateViewController = RateViewController()
        rateViewController.modalPresentationStyle = .fullScreen
        self.present(rateViewController, animated: true, completion: nil)
    }
    
    @IBAction func seasonChanged(_ sender: UISegmentedControl) {
        let seasonNumber = sender.selectedSegmentIndex + 1
        self.setupData(seasonNumber)
    }
    
    // MARK: EpisodeTableViewCellDelegate
    
    func didRateChanged() {
        self.tableView.reloadData() // si hay un cambio en setRating llama aqui y lo recarga, que es el que se encarga de recargar, n o podemos hacerlo en el rateviewcontroller
    }
    
//    Sale el objc porque las tripas del notification center estan en objective-c
    @objc func didFavoriteChanged() {
        self.tableView.reloadData()
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false //evita que podamos seleccionar una celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //código que se ejecuta si se selecciona la celda
    }
    
    // MARK: - UITableViewDatasource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell {
            let ep = episodes [indexPath.row]
            cell.setEpisode(ep)
            cell.delegate = self
            cell.rateBlock = { () -> Void in // está definida en el cell, es una closure, y cuando lo llamamos desde alli ejecuta esto
                let rateViewController = RateViewController.init(withEpisode: ep)
                rateViewController.delegate = self // le decimos que el delegado del rate sea el viewcontroller
                let navigationController = UINavigationController.init(rootViewController: rateViewController)//para que tenga barra superior
                self.present(navigationController, animated: true, completion: nil)
            }
            return cell
        }
        fatalError("Could not create the Episode cell")
    }
}

