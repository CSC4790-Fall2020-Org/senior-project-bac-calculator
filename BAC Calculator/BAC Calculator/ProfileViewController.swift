//
//  ProfileViewController.swift
//  BAC Calculator
//
//  Created by Trevor Yandow on 11/17/20.
//  Copyright © 2020 Trevor Yandow. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    var userWeight: String = ""
    var DrinksVC = DrinkScreenViewController()
    let dispatchGroup = DispatchGroup()
    let currentUserName : String = (Auth.auth().currentUser?.displayName)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weight.text = userWeight
        userName.text = currentUserName
    }
    
    @IBAction func getValWeight(_ sender: Any){
        userWeight = weight.text!
        self.dispatchGroup.enter()
        if userWeight != "" {
            DrinksVC.numWeight = Int(userWeight)!
        }
        //print("Profile VC: ", DrinksVC.numWeight)
    }
}
