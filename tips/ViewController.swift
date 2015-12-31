//
//  ViewController.swift
//  tips
//
//  Created by Brian Hillsley on 12/17/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var SettingsBarButtonItem: UIBarButtonItem!
    @IBAction func onTap(sender: AnyObject) {
        // Takes away keyboard if it is open
        view.endEditing(true)
    }
    @IBOutlet weak var tipRateController: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billAmountField: UITextField!
    
    @IBAction func onEditingChange(sender: AnyObject) {
        
        // Get bill amount
        let billAmount:Double = ((billAmountField.text)! as NSString).doubleValue
        
        // Gather tip rates based on user defaults
        var tipRates = [0.18, 0.2, 0.22]
        let defaults = NSUserDefaults.standardUserDefaults()
        let midValue = defaults.doubleForKey("user_default_mid_rate")
        let increment = defaults.doubleForKey("user_default_increment")
        
        // Set the various choices of rate
        tipRates[0] = (1-increment)*midValue
        tipRates[1] = midValue
        tipRates[2] = (1+increment)*midValue
        
        let tipRate:Double = tipRates[tipRateController.selectedSegmentIndex]
        
        let tip:Double = billAmount * tipRate
        let total: Double = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
            
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Tip Calculator" // Title for navigation bar
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        
        // TODO NEED TO MAKE SURE I AM NOT OVERRIDING USER DEFAULT EVERYTIME THE APP IS RAN
        
        // Set the EZtip default middle tip rate
        // this value can be restored in settings page
        //let defaults = NSUserDefaults.standardUserDefaults()
        //defaults.setDouble(0.2, forKey: "EZtip_default_mid_rate")
        //defaults.synchronize()
        
        // Set the user default middle tip rate to be 20%
        //defaults.setDouble(0.2, forKey:"user_default_mid_rate")
        //defaults.synchronize()
        
        // Set the user default increment rate to be 2%
        //defaults.setDouble(0.02, forKey:"user_default_increment")
        //defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

