//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Paweł Brzozowski on 20/11/2021.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var articleURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        // Check that theres a url
        if articleURL != nil {
            
            // Create a URL object
            let url = URL(string: articleURL!)
            
            guard url != nil else {
                print("Couldnt create a URL object (WebView)")
                return
            }
            // Crete a URL request
            let request = URLRequest(url: url!)
            
            // Load it in the webview
            webView.load(request)
        }
        
    }

}
