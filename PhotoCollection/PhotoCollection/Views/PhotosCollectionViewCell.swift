//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Brandi on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cellPhoto: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let photo = photo else { return }
        
        cellPhoto.image = UIImage(data: photo.imageData)
        photoLabel.text = photo.title
        
    }
}
