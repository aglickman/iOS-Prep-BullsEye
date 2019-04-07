//
//  AboutAuthorViewController.swift
//  BullsEye
//
//  Created by Glickman,Allan D on 4/6/19.
//  Copyright © 2019 Glickman,Allan D. All rights reserved.
//

import UIKit
import WebKit

class AboutAuthorViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeViewController() {
        dismiss(animated: true, completion: nil)
    }
    
}
