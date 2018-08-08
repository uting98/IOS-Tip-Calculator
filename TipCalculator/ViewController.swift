//
//  ViewController.swift
//  TipCalculator
//
//  Created by Yu Ting Yang on 8/8/18.
//  Copyright © 2018 Yu Ting Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitOne: UILabel!
    @IBOutlet weak var splitTwo: UILabel!
    @IBOutlet weak var splitThree: UILabel!
    @IBOutlet weak var splitInput: UILabel!
    @IBOutlet weak var userInput: UITextField!
    var tipPercentage: [Double] = [0.15, 0.18, 0.2]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //billText.resignFirstResponder()
        billText.becomeFirstResponder()
        userInput.becomeFirstResponder()
        billText.backgroundColor = UIColor(red:144/255, green:171/255, blue:245/255, alpha:1)
        userInput.backgroundColor = UIColor(red:144/255, green:171/255, blue:245/255, alpha:1)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // update the tip amount
        let defaults = UserDefaults.standard
        tipPercentage[0] = defaults.double(forKey: "tip1")
        tipPercentage[1] = defaults.double(forKey: "tip2")
        tipPercentage[2] = defaults.double(forKey: "tip3")
        
        tipControl.setTitle((String(format: "%.2f", tipPercentage[0]*100) + "%"), forSegmentAt: 0)
        tipControl.setTitle((String(format: "%.2f", tipPercentage[1]*100) + "%"), forSegmentAt: 1)
        tipControl.setTitle((String(format: "%.2f", tipPercentage[2]*100) + "%"), forSegmentAt: 2)
        //tipControl.setTitle("\(tipPercentage[0]*100)"+"%", forSegmentAt: 0)
        //tipControl.setTitle("\(tipPercentage[1]*100)"+"%", forSegmentAt: 1)
        //tipControl.setTitle("\(tipPercentage[2]*100)"+"%", forSegmentAt: 2)
        
        
        tipInput(self)
    }
    
    

    @IBAction func disableKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func tipInput(_ sender: Any) {
        print(tipPercentage)
        
        let bill = Double(billText.text!) ?? 0
        
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        print(tip)
        
        let totalOne = bill + tip
        let totalTwo = totalOne/2
        let totalThree = totalOne/3
        let NumSplit = Double(userInput.text!) ?? 1
        let totalInput = totalOne/NumSplit
        
        splitOne.text = String(format: "$%.2f", totalOne)
        splitTwo.text = String(format: "$%.2f", totalTwo)
        splitThree.text = String(format: "$%.2f", totalThree)
        splitInput.text = String(format: "$%.2f", totalInput)
        
    }
    
    
}

