//
//  CategoryNetworkProvider.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 05/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class CategoryNetworkProvider: BaseNetworkProvider {
    
    func retrieveCategories(storeId: Int, completion: @escaping NetworkCompletion<[Category]>) {
        
        self.GET(endpoint: APIEndpoint.retrieveCategories(storeId: storeId)) { dataRequest in
            dataRequest.responseCategories { response in
                self.handleResponse(response: response, completion: completion)
            }
        }
        
    }
    
    func allCategoriesSortBy(storeId: Int, categoryId: String, completion: @escaping NetworkCompletion<[SortBy]>) {
        
        self.GET(endpoint: APIEndpoint.allCategoriesSortBy(storeId: storeId, categoryId: categoryId)) { dataRequest in
            dataRequest.responseSortBy { response in
                self.handleResponse(response: response, completion: completion)
            }
        }
        
    }
    
}
