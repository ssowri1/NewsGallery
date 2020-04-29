//
//  Data.swift
//  Assignment-Collection
//
//  Created by Sowrirajan S on 22/04/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import Foundation

class GalleryServiceWorker: NSObject {
    class func load<T: Codable>(fileName: String, competionHandler: @escaping(T) -> Void) {
        let data: Data
        
        guard  let url = Bundle.main.url(forResource: fileName, withExtension: GalleryConstants.fileType) else {
            // Handle Error
            fatalError("couldn't find \(fileName)")
        }
        
        do {
            data = try Data(contentsOf: url)
        } catch {
            // Handle Error
            fatalError("couldn't find \(fileName), \(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            competionHandler(try decoder.decode(T.self, from: data))
        } catch {
            // Handle Error
            fatalError("couldn't find \(fileName), \(T.self) \(error)")
        }
    }
}
