//
//  DrinkScreenViewController.swift
//  BAC Calculator
//
//  Created by Trevor Yandow on 9/9/20.
//  Copyright © 2020 Trevor Yandow. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DrinkScreenViewController: UIViewController {
    
    var beerData = [String]()
    var newBeerData = [String]()
    //var beerRef:DatabaseReference?
    //var beerRef = Database.database().reference()
    //var databaseHandle:DatabaseHandle?
    //var beerList = [BeerModel]()
    @IBOutlet weak var bacLevel: UILabel!
    var ounces : Double = 0
    var UserInforVC = UserInfoViewCotroller()
    var genderCof : Double = 0.73
    var userWeight : Double = 160
    var bac : Double = 0.0
    var count : Double = 0.0
    @IBOutlet weak var doNotDrive: UILabel!
    @IBOutlet weak var skull: UIImageView!
    @IBOutlet weak var beerScroll: UIPickerView!
    //var dbRef:DatabaseReference!
    //let wineRef = Database.database().reference().child("Wine")
    //let seltzRef = Database.database().reference().child("Seltzer")
    //let liquorRef = Database.database().reference().child("Liquor")
    let ref = Database.database().reference()
    let dataRef = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bacLevel.text = "0"
        ounces = 0
        skull.isHidden = true
        beerScroll.isHidden = true
        doNotDrive.isHidden = true
        
        
        
        beerScroll.dataSource = self
        beerScroll.delegate = self
        print("MY NAME IS CHRISTOPHER LOUMEAU")
        
        ref.child("Beer").observeSingleEvent(of: .value) { (snapshot) in
            for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                self.dataRef.child("Beer").child(key).observeSingleEvent(of: .value) {(snapshot) in
                    for child in snapshot.children {
                        let nameSnap = child as! DataSnapshot
                        let nameKey = nameSnap.key
                        let nameValue = nameSnap.value!
                        if nameKey == "Name" {
                            self.beerData.append(nameValue as! String)
                        }
                        print(self.beerData)
                        print(nameKey, ": ", nameValue)
                    }
                   // print(self.beerData)
                    self.newBeerData = self.beerData
                    }
                //print(self.beerData)
            }
            //print(self.beerData)
        }
        print(newBeerData)
    }
    
    func calculateBAC(){
        //genderCof = UserInforVC.genderNumValue
        //userWeight = Double(UserInforVC.weight)!
        bac = ((ounces)*(5.14))/((userWeight)*(genderCof))
        let roundedBac = String(format: "%.3f", bac)
        if(bac > 0.08){
            doNotDrive.isHidden = false
        }
        if(bac > 0.34){
            skull.isHidden = false
            doNotDrive.isHidden = true
        }
        bacLevel.text = String(roundedBac)
    }
    
    @IBAction func onTappedBeer(_ sender: Any) {
        //print("beer")
        ounces = ounces + ((12)*(0.05))
        calculateBAC()
        beerScroll.isHidden = false
        //count = count + 1
        //bacLevel.text = String(count)
    }

    @IBAction func onTappedWine(_ sender: Any) {
        //print("wine")
        ounces = ounces + ((5)*(0.12))
        calculateBAC()
        beerScroll.isHidden = true
        //count = count + 1
        //bacLevel.text = String(count)
    }
    
    @IBAction func onTappedShot(_ sender: Any) {
        //print("shot")
        ounces = ounces + ((1)*(0.40))
        calculateBAC()
        beerScroll.isHidden = true
        //count = count + 1
        //bacLevel.text = String(count)
    }
    
    @IBAction func onTappedFriends(_ sender: Any) {
        performSegue(withIdentifier: "showFriends", sender: self)
    }
    
    @IBAction func onTappedProfile(_ sender: Any) {
        performSegue(withIdentifier: "showProfile", sender: self)
    }
}

extension DrinkScreenViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
   }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return beerData.count
    }
    
    //func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //    detailLabel.text = dataSource[row ]
    //}
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return beerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("\(beerData[row])")
        beerScroll.isHidden = true
    }
}
class BeerModel {
    var Name: String?
    var FluidOunces: String?
    var AlcoholPercentage: String?
    
    init(Name:String?, FluidOunces:String?, AlcoholPercentage:String?) {
        self.Name = Name;
        self.FluidOunces = FluidOunces;
        self.AlcoholPercentage = AlcoholPercentage;
    }
}
