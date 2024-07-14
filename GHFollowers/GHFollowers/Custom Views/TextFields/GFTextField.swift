//
//  GFTextField.swift
//  GHFollowers
//
//  Created by Rushikesh Dadas on 09/06/24.
//

import UIKit

class GFTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 8
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        translatesAutoresizingMaskIntoConstraints = false

        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType = .go
        placeholder = "Enter a Username"
    }

}
