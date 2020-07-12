//
//  TableViewViewModelType.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import Foundation

protocol DrinksViewModelType: FilterCategoryDelegate {
    
    func takeSections() -> [SectionsModel]
    
    func selectedCategory() -> [SectionsModel]
    
    func numberOfSections() -> Int
    
    func titleForHeaderInSection(section: Int) -> String
    
    func numberOfRowsInSection(section: Int) -> Int
    
    func pagination(forRowAt indexPath: IndexPath, completion: @escaping () -> Void)
    
    func loadDrinksCategories(completion: @escaping () -> Void)
    
    func loadDrinks(name: String, completion: @escaping () -> Void)
    
    //func selectedFilter(sections: [SectionsModel])
    
}
