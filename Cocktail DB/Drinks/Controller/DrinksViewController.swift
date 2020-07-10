//
//  DrinksViewController.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import UIKit

class DrinksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var dataProvider: DataProvider = RequestManager()
    private var drinks: [Drink] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        loadDrinks()
    }
    
    func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib.init(nibName: String(describing: DrinksTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DrinksTableViewCell.self))
    }
    
    private func loadDrinks() {
        
        dataProvider.loadDrinks { [weak self] response in
            var drinks: [Drink] = []
            
            for drink in response.drinks {
                drinks.append(drink)
            }
            self?.drinks = drinks
            self?.tableView.reloadData()
        }
    }
}

extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DrinksTableViewCell.self)) as! DrinksTableViewCell
        let drink = drinks[indexPath.row]
        cell.fillWith(model: drink)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
