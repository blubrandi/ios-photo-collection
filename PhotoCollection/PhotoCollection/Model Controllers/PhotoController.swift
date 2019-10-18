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
    
   func createPhoto(image: Data, title: String) -> Photo {
        
        let photo = Photo(imageData: image, title: title)
        photos.append(photo)
//        saveToPersistentStore()
        return photo
    }
    
    func updatePhoto(photo: Photo, image: Data, title: String ) {
        guard let index = photos.firstIndex(of: photo) else { return }
        
        var updatedPhoto = photo
        
        updatedPhoto.title = title
        updatedPhoto.imageData = image
        
        photos.remove(at: index)
        photos.append(updatedPhoto)
    }
}
