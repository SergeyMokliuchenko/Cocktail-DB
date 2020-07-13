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
    @IBOutlet weak var customNavigationBar: NavigationBar!
    
    private var viewModel: DrinksViewModelType = DrinksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNavigationBar()
        prepareTableView()
        loadDrinksCategories()
    }
    
    private func loadNavigationBar() {
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        customNavigationBar.delegate = self
        customNavigationBar.backButton.isHidden = true
        
        customNavigationBar.leadingConstrain.constant = 30
        customNavigationBar.contentView.layer.shadowRadius = 4.0
        customNavigationBar.contentView.layer.shadowOpacity = 0.6
        
        customNavigationBar.contentView.layer.shadowOffset = CGSize.zero
        customNavigationBar.headerLabel.text = "Drinks"
        customNavigationBar.headerLabel.font = UIFont(name: "Roboto-Medium", size: 24)
    }
    
    private func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib.init(nibName: String(describing: DrinkTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DrinkTableViewCell.self))
    }
    
    private func loadDrinksCategories() {
        viewModel.loadDrinksCategories() { [unowned self] in
            guard let name = self.viewModel.selectedCategory().first?.nameSection else { return }
            self.viewModel.loadDrinks(name: name) {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let name = self.viewModel.selectedCategory().first?.nameSection else { return }
        viewModel.loadDrinks(name: name) { [unowned self] in
            self.tableView.reloadData()
        }
    }
}

extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeaderInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DrinkTableViewCell.self)) as? DrinkTableViewCell
        
        guard let tableViewCell = cell else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        viewModel.pagination(forRowAt: indexPath) { [unowned self] in
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

extension DrinksViewController: NavigationBarDelegate {
    
    func rightAction() {
        
        let filtersViewControlelr = FiltersViewController.init()
        filtersViewControlelr.viewModel.delegate = viewModel.self
        
        let category = viewModel.takeSections()
        filtersViewControlelr.viewModel.getCategory(category: category)
        self.navigationController?.pushViewController(filtersViewControlelr, animated: true)
    }
}
