//
//  MainTabBarController.swift
//  Fakestagram
//
//  Created by Jeremy Robinson on 11/1/18.
//  Copyright © 2018 Jeremy Robinson. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    //MARK - Properties
    let photoHelper = FGPhotoHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoHelper.completionHandler = { image in
            PostService.create(for: image)
        }
        
        delegate = self
        tabBar.unselectedItemTintColor = .black
    }
}


extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            photoHelper.presentActionSheet(from: self)
            return false
        } else {
            return true
        }
    }
}
