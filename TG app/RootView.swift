//
//  RootView.swift
//  TG app
//
//  Created by NikoGenn on 09.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import Alamofire

    
    class RootView: DLHamburguerViewController {
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Do any additional setup after loading the view.
        }
        
        override func viewWillDisappear(animated: Bool) {
            super.viewWillDisappear(animated)
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        override func awakeFromNib() {
            self.contentViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DLNavigationViewController") as! UIViewController
            self.menuViewController = self.storyboard!.instantiateViewControllerWithIdentifier("DLMenuViewController") as! UIViewController
        }
}

