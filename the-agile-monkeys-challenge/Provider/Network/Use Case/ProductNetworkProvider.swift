//
//  ProductNetworkProvider.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 06/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class ProductNetworkProvider: BaseNetworkProvider {
    
    func retrieveProducts(storeId: Int, completion: @escaping NetworkCompletion<ProductContainer>) {
        
        self.GET(endpoint: APIEndpoint.retrieveProducts(storeId: storeId)) { dataRequest in
            dataRequest.responseProducts { response in
                self.handleResponse(response: response, completion: completion)
            }
        }
        
    }
    
}
