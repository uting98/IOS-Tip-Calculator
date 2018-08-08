//
//  SettingViewControl.swift
//  TipCalculator
//
//  Created by Yu Ting Yang on 8/8/18.
//  Copyright © 2018 Yu Ting Yang. All rights reserved.
//

import UIKit

class SettingViewControl: UIViewController {

    @IBOutlet weak var tipOne: UITextField!
    @IBOutlet weak var tipTwo: UITextField!
    @IBOutlet weak var tipThree: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipOne.backgroundColor = UIColor(red:255/255, green:172/255, blue:236/255, alpha:1)
        tipTwo.backgroundColor = UIColor(red:255/255, green:172/255, blue:236/255, alpha:1)
        tipThree.backgroundColor = UIColor(red:255/255, green:172/255, blue:236/255, alpha:1)
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        //let tip1 = Double(tipOne.text!) ?? 15
        defaults.set((Double(tipOne.text!) ?? 15)/100, forKey: "tip1")
        defaults.set((Double(tipTwo.text!) ?? 18)/100, forKey: "tip2")
        defaults.set((Double(tipThree.text!) ?? 20)/100, forKey: "tip3")
    
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 */

}
