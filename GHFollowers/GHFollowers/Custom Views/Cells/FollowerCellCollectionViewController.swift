//
//  FollowerCellCollectionViewController.swift
//  GHFollowers
//
//  Created by Rushikesh Dadas on 10/06/24.
//

import UIKit

private let reuseIdentifier = "FollowerCell"

class FollowerCellCollectionViewController: UICollectionViewController {
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLAbel = GFTitleLabel(textAlignment: .center, fontSize: 16)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        configure();

        // Do any additional setup after loading the view.
    }
    
    private func configure() {
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }


}
