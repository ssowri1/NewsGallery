//
//  GalleryViewModel.swift
//  Gallery
//
//  Created by Sowrirajan S on 28/04/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class GalleryViewModel: ParentObject {
    var gallery, gallerData: [Gallery]?
    func setUser(index: Int) -> Gallery? {
        guard index < gallery?.count ?? 0 else { return nil }
        guard let item = gallery?[index] else { return nil }
        return item
    }
    // get total number of rows
    func numberOfRowsinSection() -> Int {
        fetchDatas { (response: [Gallery]) in
            self.cache(data: response)
        }
        return gallery?.count ?? 0
    }
    // gache maintain for load more data
    func cache(data: [Gallery]) {
        if self.gallerData?.isEmpty ?? true {
            self.gallery = data
            self.gallerData = data
        }
    }
    // infinite loading
    func loadMoreData() {
        gallery?.append(contentsOf: gallerData!)
    }
    // get did select row id by user.
    func getSelectedId(indexPath: IndexPath) -> Int {
        return gallery?[indexPath.row].id ?? 0
    }
}

