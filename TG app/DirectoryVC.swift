//
//  SearchView.swift
//  TG app
//
//  Created by NikoGenn on 11.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import PageMenu

class DirectoryVC: UIViewController {

    
    @IBOutlet weak var menuButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // MARK: - Navigation
/*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
*/
}
