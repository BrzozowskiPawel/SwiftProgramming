//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Paweł Brzozowski on 21/11/2021.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    // Stroging refrence to article to display
    var articleToDisplay: Article?
    
    func displayArticle(_ article: Article) {
        
        // Clean up the cell before displaing next article! VERY IMPORTAN
        // We have to rmember that cells are reusable
        articleImageView.image = nil
        articleImageView.alpha = 0
        headlineLabel.text = ""
        headlineLabel.alpha = 0
        
        // Keep a refrence to the article
        articleToDisplay =  article
        
        // Set the head line
        headlineLabel.text = articleToDisplay!.title
        
        
        // Animate the label into view
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.headlineLabel.alpha = 1
        }, completion: nil)
        
        // Download and displaythe image
        
        // Check that article have an image
        guard articleToDisplay?.urlToImage != nil else {
            return
        }
        
        // Create a url string
        let urlString = articleToDisplay!.urlToImage!
        
        // Check the CahceManager before doloawding image data
        if let imageData = CacheManager.retrieveData(urlString){
            // There is image data, set the imageview and return
            articleImageView.image = UIImage(data: imageData)
            
            UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                self.articleImageView.alpha =  1
            }, completion: nil)
            
            return
        }
        
        // Crete the url
        let url = URL(string: urlString)
        
        // Chech that url isnt nil
        guard url != nil else{
            return
        }
        
        // Get a URLSession
        let session = URLSession.shared
        
        // Create a datatask
        let dataTask = session.dataTask(with: url!) { data, response, error in
            // Check taht there were no error and there is data
            if error == nil && data != nil {
                // Save data into Cache
                CacheManager.saveData(urlString, data!)
                
                
                if self.articleToDisplay?.urlToImage == urlString {
                    // Dowloading data happens in background but updating UI should be in MAINTHREAD
                    DispatchQueue.main.async {
                        // Display the image data in the image view
                        self.articleImageView.image =  UIImage(data: data!)
                        
                        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                            self.articleImageView.alpha =  1
                        }, completion: nil)
                    }
                }
            }
        }
        // Kick off the datatask
        dataTask.resume()
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
