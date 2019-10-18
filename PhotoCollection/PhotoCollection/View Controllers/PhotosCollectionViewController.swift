//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Brandi on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
        setTheme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        setTheme()
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        
        themePreference == "Blue" ? (collectionView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)) : (collectionView.backgroundColor = #colorLiteral(red: 0.1427832544, green: 0.1427832544, blue: 0.1427832544, alpha: 1))
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotoDetailSegue" {
           
            guard let destinationVC = segue.destination as? PhotoDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first
                else { return }
            
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
            destinationVC.photo = photoController.photos[indexPath.item]
        
        } else if segue.identifier == "addPhotoSegue" {
            
            guard let destinationVC = segue.destination as? PhotoDetailViewController else { return }
                
            destinationVC.themeHelper = themeHelper
            destinationVC.photoController = photoController
            
        } else if segue.identifier == "selectThemeSegue" {
            
            guard let destinationVC = segue.destination as? ThemeSelectionViewController else { return }
            
            destinationVC.themeHelper = themeHelper
            destinationVC.modalPresentationStyle = .fullScreen
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        return cell
    }

}
