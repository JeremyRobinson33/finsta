//
//  PostHeaderCell.swift
//  Fakestagram
//
//  Created by Jeremy Robinson on 11/9/18.
//  Copyright © 2018 Jeremy Robinson. All rights reserved.
//

import UIKit

class PostHeaderCell: UITableViewCell {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBAction func optionsButtonTapped(_ sender: UIButton) {
        print("options button tapped")
    }
    
    static let height: CGFloat = 54
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
