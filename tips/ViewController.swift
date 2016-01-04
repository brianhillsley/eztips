//
//  ViewController.swift
//  tips
//
//  Created by Brian Hillsley on 12/17/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func onTap(sender: AnyObject) {
        // Takes away keyboard if it is open
        view.endEditing(true)
    }
    @IBOutlet weak var tipRateController: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billAmountField: UITextField!
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBAction func onEditingChange(sender: AnyObject) {
        
        let billAmount:Double = ((billAmountField.text)! as NSString).doubleValue

        // Gather tip rates based on user defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        let midValue:Double = defaults.doubleForKey("user_default_mid_rate")
        
        let increment:Double = 0.02
        // Placeholder tip values
        var tipRates = [0.18, 0.2, 0.22]
        
        // Set the various choices of rate
        tipRates[0] = (midValue-increment)
        tipRates[1] = midValue
        tipRates[2] = (midValue+increment)
        
        tipRateController.setTitle(String(format: "%%%.1f", 100*tipRates[0]), forSegmentAtIndex: 0)
        tipRateController.setTitle(String(format: "%%%.1f", 100*tipRates[1]), forSegmentAtIndex: 1)
        tipRateController.setTitle(String(format: "%%%.1f", 100*tipRates[2]), forSegmentAtIndex: 2)
        
        // capture selected rate using selectedSegmentIndex
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
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        self.title = "EZTip"
    }
    override func viewDidAppear(animated: Bool) {
        onEditingChange(self)
        UIView.animateWithDuration(3){ () -> Void in
        self.logoImage.alpha = 0
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

