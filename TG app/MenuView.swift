//
//  MenuView.swift
//  TG app
//
//  Created by NikoGenn on 10.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import Kingfisher

class MenuView: UIViewController {
    
    @IBOutlet var avate: UIImageView!
    @IBOutlet var uName: UILabel!    
    
//    var seguesArray:Array<String> = ["screen1","screen2","screen3","screen4","screen2","screen6"]

    override func viewDidLoad() {
        super.viewDidLoad()
//        let fbU = NSUserDefaults.standardUserDefaults().valueForKey("FBUserID") as! String
//        avate.kf_setImageWithURL(NSURL(string: "https://graph.facebook.com/\(fbU)/picture?type=large")!)
//        avate.layer.cornerRadius = 5
//        uName.text = NSUserDefaults.standardUserDefaults().valueForKey("firstName") as! String
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func menu1(sender: AnyObject) {
//        let nvc = self.mainNavigationController()
//        if let hamburguerViewController = self.findHamburguerViewController() {
//            hamburguerViewController.hideMenuViewControllerWithCompletion({ () -> Void in
//                nvc.visibleViewController!.performSegueWithIdentifier(self.seguesArray[sender.tag], sender: nil)
//                hamburguerViewController.contentViewController = nvc
//            })
//        }
        
//    }
    
//    func mainNavigationController() -> DLHamburguerNavigationController {
//        return self.storyboard?.instantiateViewControllerWithIdentifier("DLNavigationViewController") as! DLHamburguerNavigationController
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
