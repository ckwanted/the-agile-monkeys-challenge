//
//  BaseNetworkProvider.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 04/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation
import Alamofire

class BaseNetworkProvider {
    
    #if DEBUG
        private let kDebugNetworking: Bool = true
    #else
        private let kDebugNetworking: Bool = false
    #endif
    
    var headers: Parameters {
        return [
            "Accept-Language": Locale.current.languageCode ?? "en",
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
    
    internal var sessionManager: Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        let manager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default)
        
        return manager
    }()
    
    private func debugging(response: DefaultDataResponse) {
        guard kDebugNetworking else {
            return
        }
        
        print("\n[\(self)] : Request \(String(describing: response.request)), \(String(describing: response.request?.allHTTPHeaderFields)) \(String(describing: response.request?.httpBody))")
        
        if let data = response.data {
            print("\n[\(self)] : Response \(String(describing: response.response)) dataString \(String(describing: String(data: data, encoding: .utf8)))")
        }
        
        if let error = response.error {
            print("\nERROR [\(self)] \(String(describing: error))")
        }
    }
    
}
