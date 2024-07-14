//
//  CardSelectionViewController.swift
//  Card Workout App
//
//  Created by Rushikesh Dadas on 07/06/24.
//

import UIKit

class CardSelectionViewController: UIViewController {
    
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var Buttons: [UIButton]!
    
    var cards : [UIImage] = Deck.allValues;
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in Buttons {
            button.layer.cornerRadius = 8;
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
}
