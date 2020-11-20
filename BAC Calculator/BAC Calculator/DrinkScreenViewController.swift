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
import FirebaseAuth
import FirebaseUI

class DrinkScreenViewController: UIViewController {
    
    var beerData = [String]()
    var newBeerData = [String]()
    var wineData = [String]()
    var newWineData = [String]()
    var shotData = [String]()
    var newShotData = [String]()
    var array = ["error", "error", "error", "error", "error"]
    //var profileVC = ProfileViewController()
    var wWeight : Int = 0
    @IBOutlet weak var bacLevel: UILabel!
    var ounces : Double = 0
    //var UserInforVC = UserInfoViewCotroller()
    var genderCof : Double = 3.75
    //var female = 4.7
    var userWeight : Double = 160
    var bac : Double = 0.0
    var count : Double = 0.0
    var time : Double = 0.0
    var typeAlc : Int = 0
    @IBOutlet weak var doNotDrive: UILabel!
    @IBOutlet weak var skull: UIImageView!
    @IBOutlet weak var beerScroll: UIPickerView!
    @IBOutlet weak var wineScroll: UIPickerView!
    @IBOutlet weak var shotScroll: UIPickerView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    let ref = Database.database().reference()
    let dataRef = Database.database().reference()
    let dispatchGroup = DispatchGroup()
    weak var timer : Timer?
    public var numWeight: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bacLevel.text = "0"
        ounces = 0
        skull.isHidden = true
        beerScroll.isHidden = true
        wineScroll.isHidden = true
        shotScroll.isHidden = true
        doNotDrive.isHidden = true
        stopButton.isHidden = true
        //wWeight = profileVC.numWeight
        //print(wWeight)
        
        //print("MY NAME IS CHRISTOPHER LOUMEAU")
        
        //Beer Data
        for i in 1...28 {
        self.dispatchGroup.enter()
        //let uid = 1
        ref.child("Beer").child(String(i)).child("Name").observeSingleEvent(of: .value,with: {(snapshot) in

            let beer = snapshot.value
            self.beerData.append(beer as! String)
            self.dispatchGroup.leave()

        }, withCancel: nil)
        }

        self.dispatchGroup.notify(queue: DispatchQueue.main, execute: {
            self.newBeerData = self.beerData
            print(self.newBeerData)
        })
        
        //Wine Data
        for i in 1...8 {
        self.dispatchGroup.enter()
        ref.child("Wine").child(String(i)).child("Name").observeSingleEvent(of: .value,with: {(snapshot) in

            let wine = snapshot.value
            self.wineData.append(wine as! String)
            self.dispatchGroup.leave()

        }, withCancel: nil)
        }

        self.dispatchGroup.notify(queue: DispatchQueue.main, execute: {
            self.newWineData = self.wineData
            print(self.newWineData)
        })
        
        //Shot Data
        for i in 1...21 {
        self.dispatchGroup.enter()
        ref.child("Liquor").child(String(i)).child("Name").observeSingleEvent(of: .value,with: {(snapshot) in

            let shot = snapshot.value
            self.shotData.append(shot as! String)
            self.dispatchGroup.leave()

        }, withCancel: nil)
        }

        self.dispatchGroup.notify(queue: DispatchQueue.main, execute: {
            self.newShotData = self.shotData
            print(self.newShotData)
        })
        
        
        self.beerScroll.dataSource = self
        self.beerScroll.delegate = self
        self.beerScroll.reloadAllComponents()
        self.wineScroll.dataSource = self
        self.wineScroll.delegate = self
        self.wineScroll.reloadAllComponents()
        self.shotScroll.dataSource = self
        self.shotScroll.delegate = self
        self.shotScroll.reloadAllComponents()
    }
    
    func calculateBAC(){
        //genderCof = profileVC.genderNumValue
        //print("Drink VC ", numWeight)
        if(numWeight != 0){
            userWeight = Double(numWeight)
            print("users new weight ", userWeight)
        }
        bac = ((ounces)*(genderCof)-(0.16)*(time))/(userWeight)
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
    
    @objc func fireTimer() {
        print(time)
        time = time + 0.016666
        calculateBAC()
    }
    
    @IBAction func onTappedBeer(_ sender: Any) {
        typeAlc = 1
        beerScroll.reloadAllComponents()
        beerScroll.isHidden = false
        wineScroll.isHidden = true
        shotScroll.isHidden = true
    }

    @IBAction func onTappedWine(_ sender: Any) {
        typeAlc = 2
        wineScroll.reloadAllComponents()
        beerScroll.isHidden = true
        wineScroll.isHidden = false
        shotScroll.isHidden = true
    }
    
    @IBAction func onTappedShot(_ sender: Any) {
        typeAlc = 3
        shotScroll.reloadAllComponents()
        beerScroll.isHidden = true
        wineScroll.isHidden = true
        shotScroll.isHidden = false
    }
    
    @IBAction func onTappedStartDrinking(_ sender: Any) {
        startButton.isHidden = true
        stopButton.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func onTappedStopDrinking(_ sender: Any) {
        startButton.isHidden = false
        stopButton.isHidden = true
        timer!.invalidate()
        ounces = 0
        time = 0
        calculateBAC()
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
        switch typeAlc {
        case 1:
            return newBeerData.count
        case 2:
            return newWineData.count
        case 3:
            return newShotData.count
        default:
            return array.count
        }
    }
    
    //func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    //    detailLabel.text = dataSource[row ]
    //}
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch typeAlc {
        case 1:
            return newBeerData[row]
        case 2:
            return newWineData[row]
        case 3:
            return newShotData[row]
        default:
            return array[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch typeAlc {
        case 1:
            print("\(newBeerData[row])")
            beerScroll.isHidden = true
            ounces = ounces + ((12)*(0.05))
            calculateBAC()
        case 2:
            print("\(newWineData[row])")
            wineScroll.isHidden = true
            ounces = ounces + ((5)*(0.12))
            calculateBAC()
        case 3:
            print("\(newShotData[row])")
            shotScroll.isHidden = true
            ounces = ounces + ((1)*(0.40))
            calculateBAC()
        default:
            print("\(array[row])")
            beerScroll.isHidden = true
            wineScroll.isHidden = true
            shotScroll.isHidden = true
            calculateBAC()
        }
            
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
