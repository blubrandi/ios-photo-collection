//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Brandi on 10/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var detailPhoto: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    private func updateViews() {
        setTheme()
        
        if let photo = photo {
            detailPhoto.image = UIImage(data: photo.imageData)
        }
        
    }
    

    @IBAction func addPhoto(_ sender: UIButton) {
    }
    
    @IBAction func savePhoto(_ sender: UIBarButtonItem) {
    }

    
     func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
         
         themePreference == "Blue" ? (view.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)) : (view.backgroundColor = #colorLiteral(red: 0.1427832544, green: 0.1427832544, blue: 0.1427832544, alpha: 1))
     }

}
