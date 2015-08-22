//
//  ViewController.swift
//  Calculator-Swift
//
//  Created by Anthony Walker on 8/16/15.
//  Copyright (c) 2015 Anthony Walker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isTyping = false
    var firstNumber = 0
    var secondNumber = 0
    var operation = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var display: UILabel!

    //handles the pressing of a number
    @IBAction func numberPressed(sender: AnyObject) {
        var number = sender.currentTitle;
        
        if isTyping {
            display.text = display.text! + number!!
        } else {
            display.text = number
            isTyping = true
        }
    }

    //this occurs when the plus/minus +/- key is pressed
    @IBAction func calculationPressed(sender: AnyObject) {
        isTyping = false
        firstNumber = display.text!.toInt()!
        operation = sender.currentTitle!!
    }
    
    //this occurs when the equals = key is pressed
    @IBAction func equalsPressed(sender: AnyObject) {
        isTyping = false
        var result = 0
        secondNumber = display.text!.toInt()!
        
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "-" {
            result = firstNumber - secondNumber
        }
        
        display.text = "\(result)"
    }
}

