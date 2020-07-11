//
//  DataProvider.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import Foundation

protocol DataProvider {
    
    func loadDrinks(with name: String, completion: @escaping (DrinksModel) -> Void)
    func loadDrinksCategories(completion: @escaping (DrinksCategoryModel) -> Void)
}
