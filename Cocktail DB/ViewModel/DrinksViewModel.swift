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
    var sections: [SectionsModel] = []
    
    func loadDrinksCategories(completion: @escaping () -> Void) {
        dataProvider.loadDrinksCategories { [unowned self] response in
            var tableViewModel: [SectionsModel] = []

            for drinkCategory in response.drinks {
                tableViewModel.append(SectionsModel(nameSection: drinkCategory.name, drinks: []))
            }
            self.sections = tableViewModel
            completion()
        }
    }
    
    func loadDrinks(name: String, completion: @escaping () -> Void) {
        
        dataProvider.loadDrinks(with: name) { [unowned self] response in
            self.sections = self.sections.map { tableViewModel -> SectionsModel in
                
                return tableViewModel.nameSection == name
                    ? SectionsModel(nameSection: name, drinks: response.drinks)
                    : tableViewModel
            }
            completion()
        }
    }

}
