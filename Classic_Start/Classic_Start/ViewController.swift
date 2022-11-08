//
//  ViewController.swift
//  Classic_Start
//
//  Created by Mindy Douglas on 10/24/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var bulldogsLabel: UILabel!
    @IBOutlet weak var hornetsLabel: UILabel!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var playButton: UIButton!
    
    var bulldogsScore = 0
    var hornetsScore = 0
    var player = "bulldogs"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        playButton.tintColor = .systemRed
        playButton.setTitle("Go Bulldogs", for: .normal)
        bulldogsLabel.text = "0"
        hornetsLabel.text = "0"
    }
    
    func updateScoreLabel() {
        bulldogsLabel.text = String(bulldogsScore)
        hornetsLabel.text = String(hornetsScore)
    }
    
    func switchPlayer() {
        if player == "bulldogs" {
            player = "hornets"
            playButton.tintColor = .systemYellow
            playButton.setTitle("Go Hornets", for: .normal)
        } else if player == "hornets"{
            player = "bulldogs"
            playButton.tintColor = .systemRed
            playButton.setTitle("Go Bulldogs", for: .normal)
        }
    }
    
    func randomPlay() {
        let number = Int.random(in: 0...3)
        switch number {
        case 0:
            touchdown()
        case 1:
            fieldGoal()
        case 2:
            interception()
        case 3:
            firstDown()
        default:
            firstDown()
        }
    }
    
    func touchdown() {
        if player == "bulldogs" {
            bulldogsScore += 7
        } else {
            hornetsScore += 7
        }
        
        messageLabel.text = "Touchdown! 7 points!"
        updateScoreLabel()
        switchPlayer()
    }
    
    func fieldGoal() {
        if player == "bulldogs" {
            bulldogsScore += 3
        } else {
            hornetsScore += 3
        }
        
        messageLabel.text = "FieldGoal! 3 points!"
        updateScoreLabel()
        switchPlayer()
    }
    
    func interception() {
        messageLabel.text = "Interception! Their turn!"
        switchPlayer()
    }
    
    func firstDown() {
        messageLabel.text = "First Down! Go again!"
    }
    

    @IBAction func playButton(_ sender: UIButton) {
        randomPlay()
        
        if bulldogsScore >= 50 || hornetsScore >= 50 {
            messageLabel.text = "Game Over!"
            playButton.isEnabled = false
        }
    }
    
}

