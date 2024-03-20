//
//  SettingsContractViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 10/02/24.
//

import UIKit
import WebKit

class SettingsContractViewController: UIViewController, WKNavigationDelegate {

    private let webView = WKWebView()
    
    override func loadView() {
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        let url = URL(string: "https://mytaxi.uz/agreement/")!
        let urlResuest = URLRequest(url: url)
        webView.load(urlResuest)
        webView.allowsBackForwardNavigationGestures = true
    }    
}

