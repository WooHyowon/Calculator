//
//  ViewController.swift
//  Calculator
//
//  Created by 우효원 on 2017. 12. 20..
//  Copyright © 2017년 HYOWON LEO WOO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var userIsInTheMiddleOfTheTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTheTyping {
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTheTyping = true
        }
    }
    
    var displayValue: Double{
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        userIsInTheMiddleOfTheTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            switch mathematicalSymbol {
            case "π":
                displayValue = Double.pi
                //display.text! = String(Double.pi)
            case "√":
                displayValue = sqrt(displayValue)
                //let operand = Double(display.text!)!
                //display.text! = String(sqrt(operand))
            default:
                break
            }
        }
    }
    
}

