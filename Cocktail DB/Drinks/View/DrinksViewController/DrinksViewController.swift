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
    
    private var viewModel: DrinksViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        viewModel?.loadDrinks() { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib.init(nibName: String(describing: DrinksTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DrinksTableViewCell.self))
    }
    
    @IBAction func filterButtonAction(_ sender: UIBarButtonItem) {
        self.tableView.reloadData()
    }
    
}

extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DrinksTableViewCell.self)) as? DrinksTableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
