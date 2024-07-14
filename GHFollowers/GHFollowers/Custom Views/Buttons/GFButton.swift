//
//  GFButton.swift
//  GHFollowers
//
//  Created by Rushikesh Dadas on 09/06/24.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        // pehele parents ki toh saari properties lele
        super.init(frame: frame)
        // abhi apnii khudhki custom likhi yo
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(background : UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = background
        self.setTitle(title, for: .normal)
        configure()
    }
    
    
    private func configure() {
        layer.cornerRadius = 8;
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
}
