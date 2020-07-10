//
//  DrinkModel.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import Foundation

struct DrinkModel: Decodable {
    
    let drinks: [Drink]
    
}

struct Drink: Decodable {
    
    let drink: String
    let drinkThumb: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case drink = "strDrink"
        case drinkThumb = "strDrinkThumb"
        case id = "idDrink"
    }
}
