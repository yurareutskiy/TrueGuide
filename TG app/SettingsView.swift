//
//  SettingsView.swift
//  TG app
//
//  Created by NikoGenn on 23.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit

class SettingsView: UIViewController{

    @IBOutlet var toptopView: UIView!
    @IBOutlet var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.backgroundColor = UIColor(red: 0, green: 150/255, blue: 136/255, alpha: 1)
        toptopView.backgroundColor = UIColor(red: 0, green: 121/255, blue: 107/255, alpha: 1)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backB(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    @IBAction func exit(sender: AnyObject) {
        
        
        
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
