//
//  DrinksTableViewCellViewModel.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import Foundation
import Kingfisher

class DrinksTableViewCellViewModel {
    
    private var drink: Drink
    
    var name: String {
        return drink.name
    }
    
    var image: UIImage {
        return loadImage(string: drink.imageURL)
    }
    
    private func loadImage(string url: String) -> UIImage {
        
        guard let url: URL = URL(string: url) else { return UIImage() }
            
        if let data = try? Data(contentsOf: url) {
            let image: UIImage = UIImage(data: data)!

            return image
        }
        
        return UIImage()
    }
    
    init(drink: Drink) {
        self.drink = drink
    }
}
