//
//  GalleryViewCollectionViewCell.swift
//  Gallery
//
//  Created by Sowrirajan S on 28/04/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class GalleryViewCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    var userData: Gallery? {
        didSet {
            if let data = userData {
                imageView.image = UIImage.init(named: data.imageName)
                title.text = data.title
                dateLabel.text = data.date
            }
        }
    }
}

