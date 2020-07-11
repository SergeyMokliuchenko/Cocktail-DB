//
//  FiltersTableViewViewModel.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 11.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import Foundation

class FiltersTableViewViewModel: TableViewViewModelType {
    
    private var dataProvider: DataProvider = RequestManager()
    private var filters: [Category] = []
    
    func numberOfRows() -> Int {
        return filters.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let filter = filters[indexPath.row]
        
        return FilterTableViewCellViewModel(category: filter)
    }
    
    func loadDrinks(completion: @escaping () -> Void) {
        dataProvider.loadDrinksCategory { [unowned self] response in
            var filters: [Category] = []
            
            for filter in response.drinks {
                filters.append(filter)
            }
            self.filters = filters
            completion()
        }
    }
    
}
