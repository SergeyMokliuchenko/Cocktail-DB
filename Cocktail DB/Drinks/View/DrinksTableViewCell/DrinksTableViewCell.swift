//
//  DrinksTableViewCell.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import UIKit
import Kingfisher

class DrinksTableViewCell: UITableViewCell {
    
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func fillWith(model: Drink) {
        self.drinkNameLabel.text = model.drink
        guard let url = URL(string: model.drinkThumb) else { return }
        loadImage(with: url)
    }
    
    func loadImage(with url: URL) {
        self.drinkImageView.kf.setImage(with: url)
    }
}
