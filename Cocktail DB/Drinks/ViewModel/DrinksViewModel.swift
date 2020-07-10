//
//  DrinksViewModel.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import Foundation

class DrinksViewModel {
    
    private var dataProvider: DataProvider = RequestManager()
    private var drinks: [Drink] = []
    
    func loadDrinks(completion: @escaping () -> Void) {
        dataProvider.loadDrinks { [unowned self] response in
            var drinks: [Drink] = []
            
            for drink in response.drinks {
                drinks.append(drink)
            }
            self.drinks = drinks
            
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        return drinks.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DrinksTableViewCellViewModel? {
        let drink = drinks[indexPath.row]
         
        return DrinksTableViewCellViewModel(drink: drink)
    }
    
}
