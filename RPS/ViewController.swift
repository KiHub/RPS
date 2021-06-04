//
//  ViewController.swift
//  RPS
//
//  Created by  Mr.Ki on 03.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var robotButton: UIButton!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    
    @IBOutlet weak var paperButton: UIButton!
    
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEvent.EventSubtype.motionShake {
            reset()
            valueLeft = 0
            valueRight = 0
            counterLabel.text = "\(valueLeft):\(valueRight)"
        }
    }
    
    var valueLeft = 0
    var valueRight = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.isHidden = true
    }
    
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        resetButton.isHidden = false
        
        let result = sign.getResult(for: computerSign)
        switch result {
        case .win:
            statusLabel.text = "Win"
            self.view.backgroundColor = #colorLiteral(red: 0.8196078431, green: 0.9176470588, blue: 0.6392156863, alpha: 1)
            valueLeft += 1
            counterLabel.text = "\(valueLeft):\(valueRight)"
        case .lose:
            statusLabel.text = "Lose"
            self.view.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.5647058824, blue: 0.4784313725, alpha: 1)
            valueRight += 1
            counterLabel.text = "\(valueLeft):\(valueRight)"
            
        case .draw:
            statusLabel.text = "="
            self.view.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.7764705882, blue: 0.5294117647, alpha: 1)
            counterLabel.text = "\(valueLeft):\(valueRight)"
            
        case .start:
            reset()
        }
        
    }
    func reset() {
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        resetButton.isHidden = true
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        statusLabel.text = "Rock, Paper, Scissors?"
        robotButton.setTitle("👾", for: .normal)
    }
    
    
    // MARK: - IBAction
    
    
    
    @IBAction func rockButtonPressed(_ sender: Any) {
        play(.rock)
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(.paper)
    }
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(.scissors)
    }
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
    
    @IBAction func robotButtonPressed(_ sender: UIButton) {
        valueLeft = 0
        valueRight = 0
        counterLabel.text = "\(valueLeft):\(valueRight)"
        
    }
    
}

