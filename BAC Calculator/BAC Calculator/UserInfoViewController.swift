//
//  UserInfoViewController.swift
//  BAC Calculator
//
//  Created by Trevor Yandow on 9/9/20.
//  Copyright © 2020 Trevor Yandow. All rights reserved.
//

import UIKit
//import Firebase

class UserInfoViewCotroller: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var birthdayField: UITextField!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var genderOption: UISegmentedControl!
    var name : String = ""
    var email : String = ""
    var username : String = ""
    var birthday : String = ""
    var height : String = ""
    var weight : String = ""
    var gender : Int = 3
    var genderNumValue : Double = 0.0
    //var ref: DatabaseReference!
    //ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTappedCheers(_ sender: Any) {
        //self.dismiss(animated: true, completion:nil)
        performSegue(withIdentifier: "toDrinks", sender: self)
        name = nameField.text!
        email = emailField.text!
        username = usernameField.text!
        birthday = birthdayField.text!
        height = heightField.text!
        weight = weightField.text!
        gender = genderOption.selectedSegmentIndex
        if(gender == 0){
            genderNumValue = 3.75
        }else{
            genderNumValue = 4.7
        }
       
    }
}
