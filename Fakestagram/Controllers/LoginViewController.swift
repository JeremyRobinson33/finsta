//
//  LoginViewController.swift
//  Fakestagram
//
//  Created by Jeremy Robinson on 10/24/18.
//  Copyright © 2018 Jeremy Robinson. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI
import FirebaseDatabase

typealias FIRUser = FirebaseAuth.User

class LoginViewController: UIViewController {
    //MARK - Outlets
    @IBOutlet weak var loginButtonTapped: UIButton!
    
    //MARK - Actions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let authUI = FUIAuth.defaultAuthUI() else {return}
        
        authUI.delegate = self
        let authViewController = authUI.authViewController()
        present(authViewController,animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
        }
       
        guard let user = user else {return}
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                //handle existing user
                User.setCurrent(user,writeToUserDefaults: true)
                
               
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            }
            //handle new user
            self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            
        }
        
    }
}

