//
//  RequestManager.swift
//  Cocktail DB
//
//  Created by Serhii Mokliuchenko on 10.07.2020.
//  Copyright © 2020 Serhii Mokliuchenko. All rights reserved.
//

import Foundation
import Alamofire

protocol DataProvider {
    
    func loadDrinks(completion: @escaping (DrinkModel) -> Void)
}

struct RequestManager: DataProvider {

    func loadDrinks(completion: @escaping (DrinkModel) -> Void) {
        let url = RequestManagerConstants.baseURL + "api/json/v1/1/filter.php"
        let params: Parameters = ["c" : "Coffee / Tea"]
        AF.request(url, method: .get, parameters: params).validate().responseDecodable(of: DrinkModel.self) { response in
            guard let weather = response.value else { return }
            completion(weather)
        }
    }
    
}
