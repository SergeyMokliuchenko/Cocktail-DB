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
    
    var completion: ((String) -> Void)?
    
//    weak var viewModel: TableViewCellViewModelType? {
//        willSet(viewModel) {
//            guard let viewModel = viewModel else { return }
//            filterNameLabel.text = viewModel.name
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        filterNameLabel.font = UIFont(name: "Roboto-Regular", size: 16)
    }
    
    func fillWith(model: SectionsModel) {
        filterNameLabel.text = model.nameSection
        checkBoxButton.isSelected = model.isSelected
    }
    
    @IBAction func checkBoxButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        guard let name = filterNameLabel.text else { return }
        completion?(name)
    }
    
}
