//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Brandi on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    private func createPhoto(withData imageData: Data , withTitle title: String) -> Photo {
        
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
//        saveToPersistentStore()
        return photo
    }
    
    private func updatePhoto(photo: Photo, withData imageData: Data, withTitle title: String ) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
        var updatedPhoto = photo
        
        updatedPhoto.title = title
        updatedPhoto.imageData = imageData
        
        photos.remove(at: index)
        photos.append(updatedPhoto)
    }
}
