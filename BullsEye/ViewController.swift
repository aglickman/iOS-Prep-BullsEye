//
//  ViewController.swift
//  BullsEye
//
//  Created by Glickman,Allan D on 3/31/19.
//  Copyright © 2019 Glickman,Allan D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        
    
    }
    
    @IBAction func showAlert(){
        
        //print("Hello!")
        let alert = UIAlertController(title: "Hello, World!", message: "This is my first app!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }

}

