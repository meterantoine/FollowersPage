//
//  UserCell.swift
//  FollowPage
//
//  Created by Antoine Perry on 5/12/20.
//  Copyright © 2020 Antoine Perry. All rights reserved.
//

import UIKit

protocol UserCellDelegate: class {
    func followedTapped(cell: UserCell)
}

class UserCell: UITableViewCell {
    
    // MARK: - Properties
    
    weak var delegate: UserCellDelegate?
    
    var user: User? {
        didSet {
            profileImage.image = user?.profileImage
            fullname.text = user?.fullname
            username.text = user?.username
        }
    }
    
    private let profileImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .gray
        return iv
    }()
    
    private let fullname: UILabel = {
        let label = UILabel()
        label.text = "Kakarot"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let username: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Goku"
        return label
    }()
    
    lazy var followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = .customBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handleFollowedTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleFollowedTapped() {
        delegate?.followedTapped(cell: self)
    }
    
    // MARK: - Helper Functions
    
    func configureUI() {
        backgroundColor = .white
        
        addSubview(profileImage)
        profileImage.centerY(inview: self)
        profileImage.anchor(left: leftAnchor, paddingLeft: 8)
        profileImage.setDimensions(width: 60, height: 60)
        profileImage.layer.cornerRadius = 60 / 2
        
        let nameStack = UIStackView(arrangedSubviews: [username, fullname])
        nameStack.axis = .vertical
        nameStack.spacing = 5
        nameStack.distribution = .fillProportionally
        
        addSubview(nameStack)
        nameStack.centerY(inview: self)
        nameStack.anchor(left: profileImage.rightAnchor, paddingLeft: 10)
        
        addSubview(followButton)
        followButton.centerY(inview: self)
        followButton.anchor(right: rightAnchor, paddingRight: 8)
        followButton.setDimensions(width: 108, height: 32)
    }
}
