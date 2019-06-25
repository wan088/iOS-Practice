//
//  webViewController.swift
//  Chapter08
//
//  Created by Yongwan on 12/04/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
import WebKit
class webViewController: UIViewController{
    var movie: MovieVO?
    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var webView: WKWebView!
    override func viewDidLoad() {
        let req = URLRequest(url: URL(string: (self.movie?.detail!)!)!)
        self.navigationItem.title = movie?.title
        self.webView.load(req)
        self.webView.uiDelegate = self
        self.webView.navigationDelegate = self
    }
}
extension webViewController: WKUIDelegate{
    
}
extension webViewController: WKNavigationDelegate{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("??")
        self.spinner.startAnimating();
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating()
        let alert = UIAlertController(title: "테스트", message: "테스트테스트", preferredStyle: .alert)
        let cancle = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(cancle)
        self.present(alert, animated: true)
    }
}

