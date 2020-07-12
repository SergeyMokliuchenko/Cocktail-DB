//
//  FiltersViewModel.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 11.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import Foundation

class FiltersViewModel {
    
    var delegate: FilterCategoryDelegate!
    private var category: [SectionsModel] = []
    
    func getCategory(category: [SectionsModel]) {
        self.category = category
    }
    
    func takeCategory() -> [SectionsModel] {
        return category
    }
    
    func numberOfRowsInSection1() -> Int {
        return category.count
    }
    
    func selectedFilter(name: String) {
        category = category.map{ category -> SectionsModel in
            
            if category.nameSection == name {
                return SectionsModel(nameSection: name, drinks: [], isSelected: !category.isSelected)
            }
            return category
        }
    }
}
