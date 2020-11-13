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
import FirebaseUI


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTappedLetsDrink(_ sender: Any) {
        //FUIAuth.defultAuthUI()
        //Get the default auth UI object
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            //Log the error
            return
        }
        
        //Set ourselves as the delegate
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        
        //Get a reference to the auth UI view controller
        let authViewController = authUI!.authViewController()
        
        //Show it
        present(authViewController, animated: true, completion: nil)
    }
    
}
extension ViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            //Log error
        }
        
        //authDataResult?.user.uid
        
        performSegue(withIdentifier: "drinksPage", sender: self)
    }
}

