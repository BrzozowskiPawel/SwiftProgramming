//
//  PhotoTableViewCell.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 28/11/2021.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    var photo: Photo?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func displayPhoto(photo: Photo) {
        // Becasue this is reusable cell we are gona firstly reset the photo.
        self.photoImageView.image = nil
        
        // Set photo property
        self.photo = photo
        
        // Set the username
        usernameLabel.text = photo.byUsername
        
        // Set the date
        dateLabel.text = photo.date
        
        // Check that there's a valid doload url
        if photo.url == nil {
            return
        }
        
        // Before dowloading the image we would like to chech if its in cach (meybe its not nessesary to dowload it)
        if let cacheImage = ImageCacheService.getImage(url: photo.url!){
            // Use the cahce dimage
            self.photoImageView.image = cacheImage
            
            // return we dont need to dowload
            return
        }
        
        // Dowload the image
        let url = URL(string: photo.url!)
        
        // Check that url obejct was created
        if url == nil {
            return
        }
        
        // Doload image using url session (async)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if error == nil && data != nil {
                
                // Set the image view
                let image = UIImage(data: data!)
                
                // Store image data in cache
                ImageCacheService.saveImage(url: url!.absoluteString, image: image)
                
                // MAKE SURE THAT THIS CEL AND ITS IMAGE IS STIL IN VIEW b4 displaing
                if url!.absoluteString != self.photo?.url! {
                    return
                }
                
                
                // Set the image view (IN MAINT HREAD -> Updating UI)
                DispatchQueue.main.async {
                    self.photoImageView.image = image
                }
            }
        }
        dataTask.resume()
        
    }
}
