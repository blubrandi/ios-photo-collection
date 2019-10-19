//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Brandi on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imagePicker = UIImagePickerController()
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    var delegate: PhotosCollectionViewController?
    
    @IBOutlet weak var detailPhoto: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
        imagePicker.delegate = self

    }
    
    private func updateViews() {
        setTheme()
        
        if let photo = photo {
            detailPhoto.image = UIImage(data: photo.imageData)
        }
        
    }
    

    @IBAction func addPhoto(_ sender: Any) {
        
        let picker = UIImagePickerController()
        
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        picker.delegate = self
        
        navigationController?.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
        
        guard let image = detailPhoto.image,
            let imageData = image.jpegData(compressionQuality: 1.0),
            let title = titleTextField.text
            else { return }
        
        if let photo = photo {
            photoController?.updatePhoto(photo: photo, image: imageData, title: title)
        } else {
            photoController?.createPhoto(image: imageData, title: title)
        }
        
        navigationController?.popViewController(animated: true)
    }

    
     func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
         
         themePreference == "Blue" ? (view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)) : (view.backgroundColor = #colorLiteral(red: 0.1427832544, green: 0.1427832544, blue: 0.1427832544, alpha: 1))
     }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          guard let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
          detailPhoto.contentMode = .scaleAspectFit
          detailPhoto.image = chosenImage
          dismiss(animated: true, completion: nil)
      }
      
      func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
          dismiss(animated: true, completion: nil)
      }

}
