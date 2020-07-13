//
//  DrinkTableViewCellViewModel.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import Foundation
import Kingfisher

class DrinkTableViewCellViewModel: TableViewCellViewModelType {
    
    private var drink: Drink
    
    var name: String {
        return drink.name
    }
    
    var image: UIImage? {
        return loadImage(string: drink.imageURL)
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
    
    init(drink: Drink) {
        self.drink = drink
    }
}
