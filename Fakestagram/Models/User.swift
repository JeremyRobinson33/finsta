//
//  User.swift
//  Fakestagram
//
//  Created by Jeremy Robinson on 10/25/18.
//  Copyright © 2018 Jeremy Robinson. All rights reserved.
//

import Foundation
import FirebaseDatabase.FIRDataSnapshot

class User: Codable {
    //MARK - Properties
    
    private static var _current: User?
    
    static var current: User {
        guard let currentUser = _current else {
            fatalError("Error: current user doesn't exist")
        }
        return currentUser
    }
    
    
    let uid: String
    let username: String
    
    static func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        if writeToUserDefaults {
            if let data = try? JSONEncoder().encode(user) {
                UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
            }
        }
        _current = user
    }
    
    //MARK - Init
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String:Any],
        let username = dict["username"] as? String
            else {return nil}
        self.uid = snapshot.key
        self.username = username
        
    }
}
