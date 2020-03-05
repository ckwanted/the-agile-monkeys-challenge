//
//  CategoryNetworkProvider.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 05/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class CategoryNetworkProvider: BaseNetworkProvider {
    
    func allCategories(storeId: Int, completion: @escaping NetworkCompletion<[Category]>) {
        
        self.GET(endpoint: APIEndpoint.allCategories(storeId: storeId)) { dataRequest in
            dataRequest.responseCategories { response in
                self.handleResponse(response: response, completion: completion)
            }
        }
        
    }
    
    func fetchFilters(storeId: Int, categoryId: String, completion: @escaping NetworkCompletion<[Filter]>) {
        
        self.GET(endpoint: APIEndpoint.filters(storeId: storeId, categoryId: categoryId)) { dataRequest in
            dataRequest.responseFilters { response in
                self.handleResponse(response: response, completion: completion)
            }
        }
        
    }
    
}
