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
    var genderCof : Double = 0.73
    var userWeight : Double = 160
    var bac : Double = 0.0
    var count : Double = 0.0
    @IBOutlet weak var skull: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bacLevel.text = "0"
        ounces = 0
        skull.isHidden = true
    }
    
    func calculateBAC(){
        //genderCof = UserInforVC.genderNumValue
        //userWeight = Double(UserInforVC.weight)!
        bac = ((ounces)*(5.14))/((userWeight)*(genderCof))
        let roundedBac = String(format: "%.3f", bac)
        if(bac > 0.34){
            skull.isHidden = false
        }
        bacLevel.text = String(roundedBac)
    }
    
    @IBAction func onTappedBeer(_ sender: Any) {
        //print("beer")
        ounces = ounces + ((12)*(0.05))
        calculateBAC()
        //count = count + 1
        //bacLevel.text = String(count)
    }

    @IBAction func onTappedWine(_ sender: Any) {
        //print("wine")
        ounces = ounces + ((5)*(0.12))
        calculateBAC()
        //count = count + 1
        //bacLevel.text = String(count)
    }
    
    @IBAction func onTappedShot(_ sender: Any) {
        //print("shot")
        ounces = ounces + ((1)*(0.40))
        calculateBAC()
        //count = count + 1
        //bacLevel.text = String(count)
    }
    
    @IBAction func onTappedFriends(_ sender: Any) {
        performSegue(withIdentifier: "showFriends", sender: self)
    }
    
}
