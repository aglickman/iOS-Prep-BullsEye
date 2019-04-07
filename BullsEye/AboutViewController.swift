//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Glickman,Allan D on 4/6/19.
//  Copyright © 2019 Glickman,Allan D. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        if let htmlPath = Bundle.main.path(forResource:
            "Bullseye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    
    }
    
    @IBAction func closeViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
}
