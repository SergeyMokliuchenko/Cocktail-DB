//
//  TableViewCellViewModelType.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import UIKit

protocol TableViewCellViewModelType: class {
    
    var name: String { get }
    var image: UIImage? { get }
    
}
