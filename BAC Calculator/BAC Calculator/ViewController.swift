//
//  ViewController.swift
//  BAC Calculator
//
//  Created by Trevor Yandow on 9/4/20.
//  Copyright © 2020 Trevor Yandow. All rights reserved.
//

import UIKit
import SwiftUI
import Firebase
import FirebaseAuth
//import FirebaseUI


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTappedLetsDrink(_ sender: Any) {
        //FUIAuth.defultAuthUI()
        performSegue(withIdentifier: "userInfo", sender: self)
    }
    
}

