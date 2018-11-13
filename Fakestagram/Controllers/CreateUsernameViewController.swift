//
//  CreateUsernameViewController.swift
//  Fakestagram
//
//  Created by Jeremy Robinson on 10/25/18.
//  Copyright © 2018 Jeremy Robinson. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    
    //MARK - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK - Actions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else {return}
       
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {return}
            
            User.setCurrent(user,writeToUserDefaults: true)
            
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
            
            print("Created new user: \(user.username)")
        }
    }
    
}
