//
//  FilterTableViewCell.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 11.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var filterNameLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            filterNameLabel.text = viewModel.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        checkBoxButton.isSelected = true
    }
    
    @IBAction func checkBoxButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
}
