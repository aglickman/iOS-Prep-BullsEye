//
//  ViewController.swift
//  BullsEye
//
//  Created by Glickman,Allan D on 3/31/19.
//  Copyright © 2019 Glickman,Allan D. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var _slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var scoreValue: Int = 0
    var roundValue: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let roundValue = _slider.value.rounded()
        currentValue = Int(roundValue)
        startNewRound()
        
//        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        _slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        _slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        _slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SmallButton")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        _slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
        
        
    }
    
    @IBAction func sliderMoved(_slider: UISlider){
        let roundValue = _slider.value.rounded()
        currentValue = Int(roundValue)
        targetValue = Int.random(in: 1...100)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        _slider.value = Float(currentValue)
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(scoreValue)
        roundLabel.text = String(roundValue)
    }
    
    @IBAction func startAgain() {
        scoreValue = 0
        roundValue = 1
        startNewRound()
    }
    
    @IBAction func showAlert(){
        
        let differenceValue: Int = abs(targetValue - currentValue)
        var pointValue: Int = 100 - differenceValue
        roundValue += 1
        scoreValue += pointValue
//        let messageValue = "The value of the slider at the current position is: \(currentValue) " +
//        "\nThe target value is: \(targetValue)" +
//        "\nDifference value is: \(differenceValue)" +
//        "\nPoint value is: \(pointValue)"

        let titleMessage: String
        if differenceValue == 0 {
            titleMessage = "Perfect!"
            pointValue = 200
        }
        else if differenceValue <= 20 {
            titleMessage = "You were close to the target!"
            pointValue = 50 + differenceValue + currentValue
        }
        else {
            titleMessage = "You were far off the target!"
        }
        
        let pointMessage: String = "You scored: \(pointValue) points!"
        let alert = UIAlertController(title: titleMessage, message: pointMessage, preferredStyle: .alert)
        let action = UIAlertAction(title: "Try again!", style: .default, handler: {
            //Need to stall so app does not refresh before person hits Try again. not executed right away, only when alert action is tapped
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

