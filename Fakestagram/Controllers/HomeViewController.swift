//
//  HomeViewController.swift
//  Fakestagram
//
//  Created by Jeremy Robinson on 11/1/18.
//  Copyright © 2018 Jeremy Robinson. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {
    
    let timeStampFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        
        return dateFormatter
    }()
    
    @IBOutlet weak var newTableView: UITableView!
    //MARK - Properties
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        UserService.posts(for: User.current){ (posts) in
            self.posts = posts
            self.newTableView.reloadData()
        }
    }
    
    func configureTableView() {
        //remove separators for empty cells
        newTableView.tableFooterView = UIView()
        //remove separators from cells
       newTableView.separatorStyle = .none
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostHeaderCell") as! PostHeaderCell
            cell.usernameLabel.text = User.current.username
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostImageCell") as! PostImageCell
            let imageURL = URL(string: post.imageURL)
            cell.postImageView.kf.setImage(with: imageURL)
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostActionCell") as! PostActionCell
            cell.timeStampLabel.text = timeStampFormatter.string(from: post.creationDate)
            
            return cell
        default:
            fatalError("Error: unexpected indexPath.")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return PostHeaderCell.height
        case 1:
            let post = posts[indexPath.section]
            return post.imageHeight
        case 2:
            return PostActionCell.height
        default:
            fatalError()
        }
    }
}
