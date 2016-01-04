//
//  SettingsViewController.swift
//  tips
//
//  Created by Brian Hillsley on 12/31/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defTipRateLabel: UILabel!
    @IBOutlet weak var decTipRateButton: UIButton!
    @IBOutlet weak var incTipRateButton: UIButton!
    @IBOutlet weak var textfield: UITextField!
    
    @IBAction func incTipRateButtonTD(sender: AnyObject) {
        increaseDefaultTipRate()
    }
    @IBAction func decTipRateButtonTD(sender: AnyObject) {
        decreaseDefaultTipRate()
    }
    
    // Decrease default tip rate by 0.5%
    func decreaseDefaultTipRate(){
        
        // Turn default tip rate label into a string and get rid of its first character, the percentage sign '%'
        let defTipStr:String = defTipRateLabel.text!
        let defTipStrWOPercent:NSString = defTipStr.substringFromIndex(defTipStr.startIndex.successor())
        
        var defaultTipRate:Double = defTipStrWOPercent.doubleValue
        if defaultTipRate > 0.5 {
            defaultTipRate -= 0.5 // 0.5% decrease
            defTipRateLabel.text = String(format: "%%%.1f", defaultTipRate)
        }
        
        // Actually store the new default value
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(defaultTipRate/100, forKey: "user_default_mid_rate")
        

    }
    
    // Increases default tip rate by 0.5%
    func increaseDefaultTipRate(){
        // Turn default tip rate label into a string and get rid of its first character, the percentage sign '%'
        let defTipStr:String = defTipRateLabel.text!
        let defTipStrWOPercent:NSString = defTipStr.substringFromIndex(defTipStr.startIndex.successor())
        
        var defaultTipRate:Double = defTipStrWOPercent.doubleValue
        defaultTipRate += 0.5 // 0.5% increase
        defTipRateLabel.text = String(format: "%%%.1f", defaultTipRate)
        
        // Actually store the new default value
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(defaultTipRate/100, forKey: "user_default_mid_rate")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set mid rate to be the user default
        let defaults = NSUserDefaults.standardUserDefaults()
        let midValue:Double = defaults.doubleForKey("user_default_mid_rate")
        defTipRateLabel.text = String(format: "%%%.1f", 100*midValue)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
