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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
//    weak var viewModel: TableViewCellViewModelType? {
//        willSet(viewModel) {
//            guard let viewModel = viewModel else { return }
//            drinkImageView.image = viewModel.image
//            drinkNameLabel.text = viewModel.name
//            activityIndicator.stopAnimating()
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        activityIndicator.startAnimating()
    }
    
    func fillWith(model: Drink) {
        self.drinkImageView.image = loadImage(string: model.imageURL)
        self.drinkNameLabel.text = model.name
    }
    
    private func loadImage(string url: String) -> UIImage {
        
        var image: UIImage = UIImage()
        guard let url: URL = URL(string: url) else { return image }
        
        KingfisherManager.shared.retrieveImage(with: url) { result in
            
            switch result {
            case .success(let value):
                image = value.image
            case .failure(let error):
                print(error)
            }
        }
        return image
    }
}
