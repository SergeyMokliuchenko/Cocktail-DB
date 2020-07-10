//
//  DrinksViewModel.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import Foundation

class DrinksViewModel: DrinksTableViewViewModelType {
    
    private var dataProvider: DataProvider = RequestManager()
    private var drinks: [Drink] = []
    
    func numberOfRows() -> Int {
        return drinks.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> DrinkTableViewCellViewModelType? {
        let drink = drinks[indexPath.row]
         
        return DrinksTableViewCellViewModel(drink: drink)
    }
    
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
    
}
