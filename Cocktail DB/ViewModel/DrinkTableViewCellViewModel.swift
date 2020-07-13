//
//  DrinkTableViewCellViewModel.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import UIKit

class DrinkTableViewCellViewModel: DrinkTableViewCellViewModelType {
    
    private var drink: Drink
    
    var name: String {
        return drink.name
    }
    
    var imageURL: NSURL {
        return NSURL(string: drink.imageURL)!
    }
    
    func downloadImageFromURL(url: NSURL, completion: @escaping (UIImage) -> Void) {
        DispatchQueue.global(qos: .userInteractive).async {
            guard let data = try? Data(contentsOf: url as URL),
            let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                completion(image)
            }
        }
    }
    
    init(drink: Drink) {
        self.drink = drink
    }
}
