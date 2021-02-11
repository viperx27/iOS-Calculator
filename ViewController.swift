//
//  ViewController.swift
//  iOS-Calculator
//
//  Created by user169737 on 4/9/20.
//  Copyright © 2020 user169737. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var operation = 0
    var flag = false
    var answer:Double = 0;

   
    @IBOutlet weak var label: UILabel!
    
       

    
    // Function to link Numeric numbers //
   
    
    @IBAction func numbers(_ sender : UIButton){
        
        if flag == true
        {
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            flag = false
        }
        else
        {
        label.text = label.text! + String(sender.tag-1)
        numberOnScreen = Double(label.text!)!
                    }
    }
    
    
    
    
    // Function to link all the arithmetic operations to the button //
    
    @IBAction func buttons(_ sender: UIButton){
        if label.text != "" && sender.tag != 11 && sender.tag != 18
        {
            
            previousNumber = Double(label.text!)!                                        // saving previous keypress number //
           
            
                                                                                        // checking tags to print desired operators //
            
            if sender.tag == 12 {
                label.text = "%"
            }
            else if sender.tag == 13 {
                label.text = "/"
            }
             else if sender.tag == 14 {
                label.text = "x"
            }
            else if sender.tag == 15 {
                label.text = "-"
        
            }
            else if sender.tag == 16 {
                label.text = "+"
            }
            
           
            operation = sender.tag
            flag = true
            
            }
        
        else if sender.tag == 18
        {
    
           if operation == 12                                                           // Performing percentage(%) operations //
           {
            answer = previousNumber * 0.01
            label.text = String(answer)
   
           }
     
           else if operation == 13 {                                                    // Perfomring (error) actions if number is divided by 0 or 0 is divided by a number //
            
            if previousNumber == 0
            {
                
                label.text! = (label.text!)
            }
                else if numberOnScreen == 0
            {
                let alert = UIAlertController(title: "Alert", message: "Invalid Action! Cannot divide by 0", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
                label.text = "0"
                
            }
            else
            {
                label.text = String( previousNumber / numberOnScreen)                        // Performing Division operation //
            }
           }
     
           else if operation == 14 {
       
                label.text = String ( previousNumber * numberOnScreen)                      // Performing multiplication operation //
            }
           else if operation == 15 {
            
                label.text = String ( previousNumber - numberOnScreen)                      // Performing Substraction operation //
            }
           else if operation == 16 {
            
                label.text = String ( previousNumber + numberOnScreen)                      // Performing addiiton operation //
            }
        }
      
            
        
        else if sender.tag == 11                                                            // Operation to Clear screen //
        {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
        
    
                                                                                        // Dot function which is linked to Button (.) //
    
    @IBAction func decimalbutton(_ sender: UIButton) {
        if label.text?.count == 0
        {
            label.text = "0."
        }
        else {
            if label.text!.range(of: ".") == nil {
                label.text = label.text! + "."
            }
        }
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                                                                                        // Do any additional setup after loading the view.
    }

    
    

}

