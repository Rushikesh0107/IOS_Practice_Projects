//
//  ColorDetailViewController.swift
//  Colors App
//
//  Created by Rushikesh Dadas on 07/06/24.
//

import UIKit

class ColorDetailViewController: UIViewController {
    
    var color : UIColor?;

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .blue
        // Do any additional setup after loading the view.
    }

}
