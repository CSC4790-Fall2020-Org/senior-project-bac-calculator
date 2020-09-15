//
//  DrinkScreenViewController.swift
//  BAC Calculator
//
//  Created by Trevor Yandow on 9/9/20.
//  Copyright © 2020 Trevor Yandow. All rights reserved.
//

import UIKit

class DrinkScreenViewController: UIViewController {
    
    @IBOutlet weak var bacLevel: UILabel!
    var ounces : Double = 0
    var UserInforVC = UserInfoViewCotroller()
    var genderCof : Double = 0.0
    var userWeight : Double = 0
    var bac : Double = 0.0
    var count : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bacLevel.text = "0"
        ounces = 0
    }
    
    func calculateBAC(){
        genderCof = UserInforVC.genderNumValue
        userWeight = Double(UserInforVC.weight)!
        bac = ((ounces)*(genderCof))/(userWeight)
        bacLevel.text = String(bac)
    }
    
    @IBAction func onTappedBeer(_ sender: Any) {
        //print("beer")
        //ounces = ounces + 12
        //calculateBAC()
        count = count + 1
        bacLevel.text = String(count)
    }
    
    @IBAction func onTappedWine(_ sender: Any) {
        //print("wine")
        //ounces = ounces + 5
        //calculateBAC()
        count = count + 1
        bacLevel.text = String(count)
    }
    
    @IBAction func onTappedShot(_ sender: Any) {
        //print("shot")
        //ounces = ounces + 1
        //calculateBAC()
        count = count + 1
        bacLevel.text = String(count)
    }
}
