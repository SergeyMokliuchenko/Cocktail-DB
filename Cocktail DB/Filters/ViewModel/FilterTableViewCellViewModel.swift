//
//  FilterTableViewCellViewModel.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 11.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import UIKit

class FilterTableViewCellViewModel: TableViewCellViewModelType {
    
    
    private var category: Category
    
    var name: String {
        return category.name
    }
    
    var image: UIImage?
    
    init(category: Category) {
        self.category = category
    }
}
