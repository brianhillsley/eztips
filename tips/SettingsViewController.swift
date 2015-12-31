//
//  SettingsViewController.swift
//  tips
//
//  Created by Brian Hillsley on 12/21/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func restoreOriginalRates(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let midValue = defaults.doubleForKey("EZtip_default_mid_rate")
        // Now set the field to say original rate and original increment
        midRateField.text="$\(midValue)%"
        
        
    }
    @IBOutlet weak var midRateField: UITextField!
    @IBOutlet weak var incrementField: UITextField!
    @IBOutlet weak var restoreRatesButton: UIButton!
    
    @IBAction func midRateChanged(sender: AnyObject) {
        print("Mid rate setting was editted")
    }
    @IBAction func incrementSettingDidEndEdit(sender: AnyObject) {
        print("increment setting was editted")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    }*/

}
