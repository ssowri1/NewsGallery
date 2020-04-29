//
//  DetailViewModel.swift
//  Gallery
//
//  Created by Sowrirajan S on 28/04/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class DetailViewModel: ParentObject {
    var gallery: [Gallery] = []
    var selectedId: Int!
    
    // Filter the selected cell content using Id
    func filter(with id: Int) -> Gallery? {
        fetchDatas { (response: [Gallery]) in
            self.gallery = response
        }
        let gallery = self.gallery.filter { $0.id == id }
        return gallery.first
    }
}
