//
//  ViewController.swift
//  Calculator
//
//  Created by Mark Hawkins on 1/31/20.
//  Copyright © 2020 Revature. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Operation {
        case plus
        case minus
        case multiply
        case divide
        case null
    }
    
    @IBOutlet weak var numberOne: UIButton!
    @IBOutlet weak var numberTwo: UIButton!
    @IBOutlet weak var numberThree: UIButton!
    @IBOutlet weak var numberFour: UIButton!
    @IBOutlet weak var numberFive: UIButton!
    @IBOutlet weak var numberSix: UIButton!
    @IBOutlet weak var numberSeven: UIButton!
    @IBOutlet weak var numberEight: UIButton!
    @IBOutlet weak var numberNine: UIButton!
    @IBOutlet weak var numberZero: UIButton!
    @IBOutlet weak var numberPlus: UIButton!
    @IBOutlet weak var numberMinus: UIButton!
    @IBOutlet weak var numberDivide: UIButton!
    @IBOutlet weak var numberMultiply: UIButton!
    @IBOutlet weak var numberEqual: UIButton!
    
    @IBOutlet weak var display: UILabel!
    
    var equation: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//-------------------------------------------------------------------------
//Insert numbers into equation
    @IBAction func numberOneAct(_ sender: UIButton) {
        equation += "1"
        display.text = String(equation)
    }
    
    @IBAction func numberTwoAct(_ sender: UIButton) {
        equation += "2"
        display.text = String(equation)
    }
    
    @IBAction func numberThreeAct(_ sender: UIButton) {
        equation += "3"
        display.text = String(equation)
    }
    
    @IBAction func numberFourAct(_ sender: UIButton) {
        equation += "4"
        display.text = String(equation)
    }
    
    @IBAction func numberFiveAct(_ sender: UIButton) {
        equation += "5"
        display.text = String(equation)
    }
    
    @IBAction func numberSixAct(_ sender: UIButton) {
        equation += "6"
        display.text = String(equation)
    }
    
    @IBAction func numberSevenAct(_ sender: UIButton) {
        equation += "7"
        display.text = String(equation)
    }
    
    @IBAction func numberEightAct(_ sender: UIButton) {
        equation += "8"
        display.text = String(equation)
    }
    
    @IBAction func numberNineAct(_ sender: UIButton) {
        equation += "9"
        display.text = String(equation)
    }
    
    @IBAction func numberZeroAct(_ sender: UIButton) {
        equation += "0"
        display.text = String(equation)
    }
//-------------------------------------------------------------------------
//Insert Operations into equation
    @IBAction func numberPlusAct(_ sender: UIButton) {
        if equation.isEmpty {
            return
        }
        
        equation += " + "
        display.text = String(equation)
    }
    
    @IBAction func numberMinusAct(_ sender: UIButton) {
        if equation.isEmpty {
            return
        }
        
        equation += " - "
        display.text = String(equation)
    }
    
    @IBAction func numberDivideAct(_ sender: UIButton) {
        if equation.isEmpty {
            return
        }
        
        equation += " / "
        display.text = String(equation)
    }
    
    @IBAction func numberMultiplyAct(_ sender: UIButton) {
        if equation.isEmpty {
            return
        }
        
        equation += " * "
        display.text = String(equation)
    }
//-------------------------------------------------------------------------
//Calculation equaltion
    @IBAction func numberEqualAct(_ sender: UIButton) {
        
        let splitEquation = equation.split(separator: " ")
        
        var nextOp: Operation = Operation.null
        var total: Int = 0
        
        for s in splitEquation {
            if total == 0 {
                total = Int(s)!
                continue
            }
            
            if (nextOp == Operation.null) {
                nextOp = getOperation(String(s))
            }
            
            if (Int(s) != nil) {
                switch nextOp {
                case Operation.plus:
                    total = addNums(total, Int(s)!)
                    break
                case Operation.minus:
                    total = minusNums(total, Int(s)!)
                    break
                case Operation.multiply:
                    total = multiplyNums(total, Int(s)!)
                    break
                case Operation.divide:
                    total = divideNums(total, Int(s)!)
                    break
                default:
                    break
                }
                
                nextOp = Operation.null
            }
            
        }
        
        equation = ""
        display.text = String(total)
    }
    
//Determine current operation
    func getOperation(_ s: String) -> Operation {
        switch s {
            case "+":
                return Operation.plus
            case "-":
                return Operation.minus
            case "*":
                return Operation.multiply
            case "/":
                return Operation.divide
            default:
                return Operation.null
        }
        
    }
//=========================================================================
//Operation Functions
    func addNums(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func minusNums(_ a: Int, _ b: Int) -> Int {
        return a - b
    }
    
    func multiplyNums(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    func divideNums(_ a: Int, _ b: Int) -> Int {
        return a / b
    }

}

