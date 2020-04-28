//
//  ViewController.swift
//  BullsEye
//
//  Created by Juan Manuel Gentili on 24/04/2020.
//  Copyright © 2020 Juan Manuel Gentili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Instance variables
    var currentValue = 0
    var targetValue = 0
    var currentScore = 0
    var currentRound = 0
    
    // Outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    // Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleSlider()
        startNewGame()
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentRound += 1
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels() {
        targetValueLabel.text = String(targetValue)
        roundLabel.text = String(currentRound)
        scoreLabel.text = String(currentScore)
    }
    
    func calculateScore() {
        var points = (100 - abs(targetValue - currentValue))
        
        // Extra points
        if points == 100 {
            points += 100
        } else if points > 95 {
            points += 50
        }
        
        currentScore += points
    }
    
    func selectTitle() -> String {
        let distance = abs(targetValue - currentValue)
        
        if distance == 0 {
            return "You are a genius!"
        } else if distance < 5 {
            return "Good shoot."
        }
        
        return "You suck men!"
    }
    
    func styleSlider() {
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func showHitMeAlert() {
        calculateScore()
        let title = selectTitle()
        
        let alert = UIAlertController(title: title, message: "You selected \(currentValue).", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: { action in self.startNewRound() })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func moveSlider(_ slider: UISlider) {
        currentValue = Int(slider.value.rounded())
    }
    
    @IBAction func startNewGame() {
        currentScore = 0
        currentRound = 0
        
        startNewRound()
    }
}

