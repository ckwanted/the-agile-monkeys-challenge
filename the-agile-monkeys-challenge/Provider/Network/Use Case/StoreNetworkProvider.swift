//
//  StoreNetworkProvider.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 04/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class StoreNetworkProvider: BaseNetworkProvider {
    
    func allStores(completion: @escaping NetworkCompletion<[Store]>) {
        
        self.sessionManager.request(APIEndpoint.allStores.url,
                                    method: .get,
                                    parameters: nil,
                                    headers: self.headers)
        .validate(contentType: ["application/json"])
        .response { response in
            self.debugging(response: response)
        }
        .validate(statusCode: 200..<300)
        .responseStores { response in
            self.handleResponse(response: response, completion: completion)
        }
        
    }
    
}
