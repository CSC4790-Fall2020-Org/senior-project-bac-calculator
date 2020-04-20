//
//  ViewController.swift
//  test4
//
//  Created by Clare Morris on 4/15/20.
//  Copyright © 2020 Clare Morris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var alcohol = 0.00
    @IBAction func beer(_ sender: Any) {
        let amt = 0.035
        alcohol = amt + alcohol
        print (alcohol)
    }
    
    @IBAction func wine(_ sender: Any) {
        let amt = 0.035
        alcohol = amt + alcohol
        print (alcohol)
    }
    
    @IBAction func shot(_ sender: Any) {
        let amt = 0.035
        alcohol = amt + alcohol
        print (alcohol)
    }
    
}

