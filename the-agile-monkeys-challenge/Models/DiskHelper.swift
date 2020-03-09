//
//  DiskHelper.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 09/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation
import Disk

typealias WishListProduct = [String: Product]

class DiskHelper {
    
    enum key: String {
        case wishList
        case cart
    }
    
    static let shared = DiskHelper()
    let directory: Disk.Directory = .documents
    
    // MARK: - Codable
    func storeInDisk<T: Codable>(key: DiskHelper.key, object: T) {
        
        do {
            try Disk.save(object, to: directory, as: key.rawValue)
        }
        catch {
            print("disk error: \(error)")
        }
        
    }
    
    func retrieveFromDisk<T: Codable>(key: DiskHelper.key, objectType: T.Type) -> T? {
        
        let path = key.rawValue
        
        do {
            if Disk.exists(path, in: directory) {
                let retrievedObject = try Disk.retrieve(path, from: directory, as: objectType)
                return retrievedObject
            }
            return nil
        }
        catch {
            print("disk error: \(error)")
            return nil
        }
        
    }
    
    func removeFromDisk(key: DiskHelper.key) {
        
        let path = key.rawValue
        
        do {
            if Disk.exists(path, in: directory) {
                try Disk.remove(path, from: directory)
            }
        }
        catch {
            print("disk error: \(error)")
        }
        
    }
    
    // MARK: - Clean
    func cleanDisk() {
        
        do {
            try Disk.clear(directory)
        }
        catch {
            print("disk error: \(error)")
        }
        
    }
    
}
