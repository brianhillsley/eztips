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
    
    @IBAction func onEditingChange(sender: AnyObject) {
        
        let billAmount:Double = ((billAmountField.text)! as NSString).doubleValue

        var tipRates = [0.18, 0.2, 0.22]
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

