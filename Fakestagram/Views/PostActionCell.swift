//
//  PostActionCell.swift
//  Fakestagram
//
//  Created by Jeremy Robinson on 11/9/18.
//  Copyright © 2018 Jeremy Robinson. All rights reserved.
//

import UIKit

class PostActionCell: UITableViewCell {
    
    //MARK - Subviews
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    //MARK - IBActions
    @IBAction func likeButtonTapped(_ sender: UIButton) {
        print("Like button tapped")
    }
    
    static let height: CGFloat = 46
    
    //MARK - Cell Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
