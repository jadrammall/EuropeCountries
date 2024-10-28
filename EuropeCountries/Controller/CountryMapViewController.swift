//
//  CountryMapViewController.swift
//  EuropeCountries
//
//  Created by Jad Rammal on 28/10/2024.
//

import UIKit
import WebKit

class CountryMapViewController: UIViewController {
    
    var urlString: String?
    private var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        loadMap()
    }
    
    private func setupWebView() {
        webView = WKWebView(frame: self.view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(webView)
    }
    
    private func loadMap() {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
