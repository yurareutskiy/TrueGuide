//
//  SettingsView.swift
//  TG app
//
//  Created by NikoGenn on 23.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import SWRevealViewController

class SettingsVC: UIViewController{

    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Menu
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // Navigation Bar
//        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.082, green: 0.584, blue: 0.533, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = UIColor(red:0.00, green:0.59, blue:0.53, alpha:1.0)
        self.navigationController?.title = "Настройки"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return UIStatusBarStyle.LightContent
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
