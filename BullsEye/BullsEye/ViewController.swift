//
//  ViewController.swift
//  BullsEye
//
//  Created by Rushikesh Dadas on 28/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider : UISlider!
    @IBOutlet var targetLabel : UILabel!
    @IBOutlet var scoreLabel : UILabel!
    @IBOutlet var roundLabel : UILabel!
    
    var currentValue : Int = 0;
    var targetValue = 0;
    var score = 0;
    var round : Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        let points = 100 - difference
        score += points
        
        let title: String
        if difference == 0 {
          title = "Perfect!"
        } else if difference < 5 {
          title = "You almost had it!"
        } else if difference < 10 {
          title = "Pretty good!"
        } else {
          title = "Not even close..."
        }
        
        let message = "You scored \(points) points";

        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                self.startNewRound()
            }
        )
        
        alert .addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver(){
        startNewGame()
    }
    
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue);
        scoreLabel.text = String(score);
        roundLabel.text = String(round);
    }


}

