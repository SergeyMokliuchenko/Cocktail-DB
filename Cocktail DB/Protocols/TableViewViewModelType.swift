//
//  TableViewViewModelType.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import Foundation

protocol TableViewViewModelType {
    
    func numberOfRowsCategory() -> Int
    func headerTitlesSection(with section: Int) -> String
    func numberOfRowsDrinks() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType?
    func loadDrinksCategory(completion: @escaping () -> Void)
    func loadDrinks(completion: @escaping () -> Void)
    
}
