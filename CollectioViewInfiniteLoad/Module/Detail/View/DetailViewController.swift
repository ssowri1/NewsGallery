//
//  DetailViewController.swift
//  Gallery
//
//  Created by Sowrirajan S on 28/04/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    var selectedId: Int!
    var viewModel = DetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = AppConstants.detail
        if let gallery = viewModel.filter(with: selectedId) {
            self.updateData(data: gallery)
        }
    }
    
    // Update UI
    func updateData(data: Gallery) {
        DispatchQueue.main.async {
            self.imageView.image = UIImage.init(named: data.imageName)
            self.textView.text = "\(data.title) \n\n \(data.description)"
            self.dateLabel.text = data.date
        }
    }
}

