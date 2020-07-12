//
//  FiltersViewController.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 11.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var customNavigationBar: NavigationBar!
    
    var viewModel = FiltersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNavigationBar()
        prepareTableView()
    }
    
    private func loadNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        customNavigationBar.delegate = self
        customNavigationBar.filtersButton.isHidden = true
        customNavigationBar.leadingConstrain.constant = 70
        customNavigationBar.contentView.layer.shadowRadius = 4.0
        customNavigationBar.contentView.layer.shadowOpacity = 0.6
        customNavigationBar.contentView.layer.shadowOffset = CGSize.zero
        customNavigationBar.headerLabel.text = "Filters"
        customNavigationBar.headerLabel.font = UIFont(name: "Roboto-Medium", size: 24)
    }
    
    func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib.init(nibName: String(describing: FilterTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FilterTableViewCell.self))
    }
     
    @IBAction func applyButtonAction(_ sender: UIButton) {
        let sections = viewModel.takeCategory()
        viewModel.delegate.selectedFilter(sections: sections)
        navigationController?.popViewController(animated: true)
    }
}

extension FiltersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection1()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FilterTableViewCell.self)) as! FilterTableViewCell
        let category = viewModel.takeCategory()[indexPath.row]
        cell.fillWith(model: category)
        cell.completion = { name in
            self.viewModel.selectedFilter(name: name)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension FiltersViewController: NavigationBarDelegate {
    
    func leftAction() {
        navigationController?.popViewController(animated: true)
    }
}
