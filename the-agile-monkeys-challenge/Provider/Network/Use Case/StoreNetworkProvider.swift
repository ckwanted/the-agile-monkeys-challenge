//
//  StoreNetworkProvider.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 04/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class StoreNetworkProvider: BaseNetworkProvider {
    
    func retrieveStores(completion: @escaping NetworkCompletion<[Store]>) {
        
        self.GET(endpoint: APIEndpoint.retrieveStores) { dataRequest in
            dataRequest.responseStores { response in
                self.handleResponse(response: response, completion: completion)
            }
        }
        
    }
    
}
