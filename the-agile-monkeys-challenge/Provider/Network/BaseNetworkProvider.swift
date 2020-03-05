//
//  BaseNetworkProvider.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 04/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation
import Alamofire

typealias NetworkCompletion<T> = (Swift.Result<T, Error>) -> Void

class BaseNetworkProvider {
    
    #if DEBUG
        private let kDebugNetworking: Bool = true
    #else
        private let kDebugNetworking: Bool = false
    #endif
    
    internal var headers: [String: String] {
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
    
    // MARK: - Helpers
    
    internal func cancelAllRequest() {
        self.sessionManager.session.getAllTasks { dataTasks in
            dataTasks.forEach({ $0.cancel() })
        }
    }
    
    internal func debugging(response: DefaultDataResponse) {
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
    
    internal func handleResponse<T: Codable>(response: DataResponse<T>, completion: NetworkCompletion<T>) {
        
        switch response.result {
        case .success(let data):
            completion(.success(data))
        case .failure(let error):
            completion(.failure(error))
        }
        
    }
    
    // MARK: - HTTP METHODS
    
    func GET(endpoint: APIEndpoint, parameters: [String: Any]? = [:], completion: @escaping (DataRequest) -> Void) {
        
        let dataRequest = self.sessionManager.request(endpoint.url,
                                    method: .get,
                                    parameters: parameters,
                                    encoding: URLEncoding.default,
                                    headers: self.headers)
            .validate(contentType: ["application/json"])
            .response { response in
                self.debugging(response: response)
            }
            .validate(statusCode: 200..<300)
        
        completion(dataRequest)
            
    }
    
}
