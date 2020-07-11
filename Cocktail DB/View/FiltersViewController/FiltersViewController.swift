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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
    }
    
    func prepareTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib.init(nibName: String(describing: FilterTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: FilterTableViewCell.self))
    }
    
    @IBAction func applyButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension FiltersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FilterTableViewCell.self)) as? FilterTableViewCell
        guard let tableViewCell = cell else { return UITableViewCell() }
        
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}