//
//  FollowersController.swift
//  FollowPage
//
//  Created by Antoine Perry on 5/12/20.
//  Copyright © 2020 Antoine Perry. All rights reserved.
//

import UIKit

private let reuseIdentifier = "UserCell"

class FollowersController: UITableViewController {
    
    // MARK: - Properties
    
    var users = [User]()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureUsers()
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 88
    }
    
    func configureUsers() {
        let user1 = User(username: "Goku", fullname: "@Kakarot", profileImage: #imageLiteral(resourceName: "Gokunormal"), isFollowed: false)
        let user2 = User(username: "Vegeta", fullname: "@PrinceOfAll", profileImage: #imageLiteral(resourceName: "vegetapacifier"), isFollowed: false)
        let user3 = User(username: "Broly", fullname: "@Broly", profileImage: #imageLiteral(resourceName: "broly"), isFollowed: false)
        let user4 = User(username: "Trunks", fullname: "@Trunks", profileImage: #imageLiteral(resourceName: "cooltrunks"), isFollowed: false)
        let user5 = User(username: "Frieza", fullname: "@Frieza", profileImage: #imageLiteral(resourceName: "frieza"), isFollowed: false)
        let user6 = User(username: "Jiren", fullname: "@Jiren", profileImage: #imageLiteral(resourceName: "Jiren"), isFollowed: false)
        
        users.append(user1)
        users.append(user2)
        users.append(user3)
        users.append(user4)
        users.append(user5)
        users.append(user6)
        
        tableView.reloadData()
    }
}

extension FollowersController {
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
    
        cell.user = users[indexPath.row]
        cell.delegate = self
        return cell
    }
}

extension FollowersController: UserCellDelegate {
    func followedTapped(cell: UserCell) {
        guard let user = cell.user else { return }
        
        cell.user?.isFollowed = !user.isFollowed
        
        if user.isFollowed {
            // not
            cell.followButton.configureButton(didFollow: false)
        } else {
            // is following
            cell.followButton.configureButton(didFollow: true)
        }
    }
}


