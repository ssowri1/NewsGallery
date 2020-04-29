//
//  ViewController.swift
//  Gallery
//
//  Created by Sowrirajan S on 28/04/20.
//  Copyright © 2020 com.ssowri1. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    let size = UIScreen.main.bounds
    var gallery, galleryData: [Gallery]?
    private let footerView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    var selectedId: Int!
    let viewModel = GalleryViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = AppConstants.galleryTitle
        // Rigister collectionViewCell
        registerCollectionView()
        // Load collectionView layout
        configureCollectionViewLayout()
        // Fetch Datas
        loadData()
    }
    
    func registerCollectionView() {
        collectionView.register(CollectionViewFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CellIdentifier.footerCell)
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.footerReferenceSize = CGSize(width: collectionView.bounds.width, height: 50)
    }
    
    func configureCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: size.width/2 - 5, height: size.height/4 + 15)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.footerReferenceSize = CGSize(width:self.collectionView.frame.size.width, height: 50);
        collectionView.collectionViewLayout = layout
    }

    func loadData() {
        viewModel.fetchDatas { (_) in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DetailViewController {
            if let viewController: DetailViewController = segue.destination as? DetailViewController {
                viewController.selectedId = selectedId
            }
        }
    }
}

extension GalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowsinSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.cell, for: indexPath) as? GalleryViewCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.userData = viewModel.setUser(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
         if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CellIdentifier.footerCell, for: indexPath)
             footer.addSubview(footerView)
            footerView.startAnimating()
             footerView.frame = CGRect(x: 0, y: 0, width: collectionView.bounds.width, height: 50)
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.footerView.stopAnimating()
                self.footerView.removeFromSuperview()
                self.viewModel.loadMoreData()
                self.collectionView.reloadData()
            }
             return footer
         }
         return UICollectionReusableView()
     }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedId = viewModel.getSelectedId(indexPath: indexPath)
        self.performSegue(withIdentifier: SegueIdentifiers.gallerytodetail, sender: nil)
    }
}
