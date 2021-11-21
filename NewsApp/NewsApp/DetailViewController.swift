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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var articleURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
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
            
            // Start spinner
            spinner.alpha = 1
            spinner.startAnimating()
            
            // Load it in the webview
            webView.load(request)
        }
        
    }

}

extension DetailViewController: WKNavigationDelegate {
    // COntent in WebView finish loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinner.stopAnimating()
        spinner.alpha = 0
    }
}
