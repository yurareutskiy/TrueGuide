//
//  ViewController.swift
//  TG app
//
//  Created by MyMac on 14.01.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import Alamofire

class RegisterVC: UIViewController, FBLoginViewDelegate {
   
//    @IBOutlet var fbLoginView : FBLoginView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 
        print("Register VC")
        //
//        self.fbLoginView.delegate = self
//        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]

//        var obj:AnyObject
//        for obj in fbLoginView.subviews
//        {
//            if (obj.isKindOfClass(UIButton))
//            {
//                var loginButton:UIButton = obj as! UIButton
//               // loginButton.frame = CGRectMake(20, 20, 100, 100)
//                loginButton.setBackgroundImage(UIImage(named: "fb")!, forState: UIControlState.Normal)
//                loginButton.setBackgroundImage(UIImage(named: "fb")!, forState: UIControlState.Highlighted)
//                loginButton.setBackgroundImage(UIImage(named: "fb")!, forState: UIControlState.Selected)
//                loginButton.sizeThatFits(self.fbLoginView.frame.size)
//                loginButton.frame.size.height = 63
//            }
        
//            if (obj.isKindOfClass(UILabel))
//            {
//                var loginLabel:UILabel = obj as! UILabel
//                loginLabel.text = ""
//                loginLabel.frame = CGRectMake(0, 0, 0, 0);
//            }
//        }
        
//        fbLoginView.delegate = self;
        
//        self.view.addSubview(fbLoginView)
    }
    
    // MARK: IBActions
//    @IBAction func skipRegistration(sender: UIButton) {
//        print("Skip registration")
//     //   let rootMapVC: Map = Map()
//       // self.presentViewController(rootMapVC, animated: true, completion: nil)
        
//    }
    
    // MARK: Facebook Delegate Methods
//    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
//        print("User Logged In" )
//        let serverUrl = NSUserDefaults.standardUserDefaults().valueForKey("serverUrl")!
//        Alamofire.request(.GET, "http://\(serverUrl)/api/alive").responseJSON() {
//          //  (_, _, data, error) in
//            data in
//           // if data != nil {
//            if data.result.value != nil {
//                print("This is where you perform a segue")
//                Alamofire.request(.GET, "http://\(serverUrl)/api/getplaces").responseJSON() {
//                   // (_, _, data, error) in
//                    data in
//                   // if data != nil {
//                    if data.result.value != nil {
//                        print("1:\(data)")
//                     //   NSUserDefaults.standardUserDefaults().setValue(data, forKey: "places")
//                        NSUserDefaults.standardUserDefaults().setValue(data.result.value, forKey: "places")
//                    }
//                }
//                Alamofire.request(.GET, "http://\(serverUrl)/api/getroutes").responseJSON() {
//                   // (_, _, data, error) in
//                   // if data != nil {
//                    data in
//                    if data.result.value != nil {
//                        print("2:\(data)")
//                        //NSUserDefaults.standardUserDefaults().setValue(data, forKey: "routes")
//                        NSUserDefaults.standardUserDefaults().setValue(data.result.value, forKey: "routes")
//                    }
//                }
//                Alamofire.request(.GET, "http://\(serverUrl)/api/getcategories").responseJSON() {
//                   // (_, _, data, error) in
//                   // if data != nil {
//                    data in
//                    if data.result.value != nil {
//                        print("3:\(data)")
//                      //  NSUserDefaults.standardUserDefaults().setValue(data, forKey: "categories")
//                        NSUserDefaults.standardUserDefaults().setValue(data.result.value, forKey: "categories")
//                    }
//                }
//                var st = NSUserDefaults.standardUserDefaults().valueForKey("userid") as! Double
//                print("USERID: \(st)")
//                var params = ["id":st]
//                Alamofire.request(.GET, "http://\(serverUrl)/api/getfav", parameters:params).responseJSON() {
//                //    (_, _, data, _) in
//                  //  if data != nil {
//                    data in
//                    if data.result.value != nil {
//                        print("4:\(data)")
//                      //  NSUserDefaults.standardUserDefaults().setValue(data, forKey: "favplaces")
//                        NSUserDefaults.standardUserDefaults().setValue(data.result.value, forKey: "favplaces")
//                    }
//                }
//                self.delay(2.0){
//                    self.performSegueWithIdentifier("MainScreen", sender: self)
//                }
//            } else {
//                let alertController = UIAlertController(title: "Error", message:
//                    "No connection", preferredStyle: UIAlertControllerStyle.Alert)
//                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
//                self.presentViewController(alertController, animated: true, completion: nil)
//            }
//        }
//    }
    
    /*
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView! , user: FBGraphUser) {
        print(user)
        NSUserDefaults.standardUserDefaults().setValue(user.first_name, forKey: "firstName")
        NSUserDefaults.standardUserDefaults().setValue(user.objectID, forKey: "FBUserID")
        Server().registerFB(user.objectID, firstName: user.first_name, lastName: user.last_name)
        
    }
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        print("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView! , handleError:NSError) {
        print("Error: \(handleError.localizedDescription)")
    }

*/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


}

