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
    
    private var viewModel = DrinksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        viewModel.loadDrinksCategories() { [unowned self] in
            guard let name = self.viewModel.sections.first?.nameSection else { return }
            self.viewModel.loadDrinks(name: name) {
                self.tableView.reloadData()
            }
            //self.tableView.reloadData()
        }

    }
    
    func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib.init(nibName: String(describing: DrinksTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: DrinksTableViewCell.self))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        viewModel.loadDrinks() { [unowned self] in
//            self.tableView.reloadData()
//        }
    }
    
    @IBAction func filterButtonAction(_ sender: UIBarButtonItem) {
        let filtersViewControlelr = FiltersViewController.init()
        self.navigationController?.pushViewController(filtersViewControlelr, animated: true)
    }
}

extension DrinksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.sections[section].nameSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].drinks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: DrinksTableViewCell.self)) as! DrinksTableViewCell
        
        let drink = viewModel.sections[indexPath.section].drinks[indexPath.row]
        cell.fillWith(model: drink)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == viewModel.sections[indexPath.section].drinks.count - 1 {
            if indexPath.section != indexPath.last && viewModel.sections[indexPath.section + 1].drinks.isEmpty == true {
                viewModel.loadDrinks(name: viewModel.sections[indexPath.section + 1].nameSection) {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
