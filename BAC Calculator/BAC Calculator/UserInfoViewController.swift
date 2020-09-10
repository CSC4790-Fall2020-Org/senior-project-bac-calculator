//
//  UserInfoViewController.swift
//  BAC Calculator
//
//  Created by Trevor Yandow on 9/9/20.
//  Copyright © 2020 Trevor Yandow. All rights reserved.
//

import UIKit

class UserInfoViewCotroller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onTappedCheers(_ sender: Any) {
        //self.dismiss(animated: true, completion:nil)
        performSegue(withIdentifier: "toDrinks", sender: self)
    }
}
