//
//  FollowerCellCollectionViewCell.swift
//  GHFollowers
//
//  Created by Rushikesh Dadas on 10/06/24.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let reuseID = "FollowerCell"
    
    let avatarImage = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(follower : Follower) {
        usernameLabel.text = follower.login
        avatarImage.downloadImage(from : follower.avatarUrl)
    }
    
    private func configure(){
        addSubview(avatarImage)
        addSubview(usernameLabel)
        
        let padding : CGFloat = 8;
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

//#Preview{
//    FollowerCellCollectionViewCell()
//}
