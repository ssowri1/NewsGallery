//
//  ParentObject.swift
//  Gallery
//
//  Created by Sowrirajan S on 28/04/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class ParentObject: NSObject {
    func fetchDatas(closureHandler: @escaping(_ response: [Gallery]) -> Void) {
        GalleryServiceWorker.load(fileName: GalleryConstants.fileName) { (response: [Gallery]) in
            closureHandler(response)
        }
    }
}
