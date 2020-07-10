//
//  DrinksTableViewCell.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import UIKit

class DrinksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    
    var viewModel: DrinksTableViewCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            drinkImageView.image = viewModel.image
            drinkNameLabel.text = viewModel.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
}
