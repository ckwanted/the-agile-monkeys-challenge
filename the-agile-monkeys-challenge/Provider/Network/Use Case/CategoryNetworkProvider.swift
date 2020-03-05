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
        
        self.sessionManager.request(APIEndpoint.allCategories(storeId: storeId).url,
                                    method: .get,
                                    parameters: nil,
                                    headers: self.headers)
        .validate(contentType: ["application/json"])
        .response { response in
            self.debugging(response: response)
        }
        .validate(statusCode: 200..<300)
        .responseCategories { response in
            self.handleResponse(response: response, completion: completion)
        }
        
    }
    
    func fetchFilters(storeId: Int, categoryId: String, completion: @escaping NetworkCompletion<[SortBy]>) {
        
        self.sessionManager.request(APIEndpoint.categoriesSortBy(storeId: storeId, categoryId: categoryId).url,
                                    method: .get,
                                    parameters: nil,
                                    headers: self.headers)
        .validate(contentType: ["application/json"])
        .response { response in
            self.debugging(response: response)
        }
        .validate(statusCode: 200..<300)
        .responseSortBy { response in
            self.handleResponse(response: response, completion: completion)
        }
        
    }
    
}
