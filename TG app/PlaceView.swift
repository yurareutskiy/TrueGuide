//
//  PlaceView.swift
//  TG app
//
//  Created by NikoGenn on 05.06.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import Alamofire

class PlaceView: UIViewController {

    @IBOutlet var adress: UILabel!

    @IBOutlet var descT: UITextView!
    @IBOutlet var titleL: UILabel!
    var placeid:Double = Double()

    internal var Info:NSDictionary = NSDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Info)
        var fields:NSMutableDictionary = Info["message"] as! NSMutableDictionary
        var fields2:NSMutableDictionary = fields["fields"] as! NSMutableDictionary
        self.titleL.text = fields2["title"] as? String
        self.titleL.textColor = UIColor(red: 0.0, green: 150.0/255, blue: 136.0/255, alpha: 1.0)
        self.adress.text = fields2["address"] as? String
        self.adress.textColor = UIColor(red: 0.0, green: 150.0/255, blue: 136.0/255, alpha: 1.0)
        self.descT.text = fields2["descr"] as? String
        placeid = fields["pk"] as! Double
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backB(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)

    }
    
    @IBAction func favadd(sender: AnyObject) {
        print(NSUserDefaults.standardUserDefaults().dictionaryRepresentation())
        let userid:Double = NSUserDefaults.standardUserDefaults().valueForKey("userid") as! Double
        print("userid: \(userid), placeid: \(placeid)")
        let serverUrl = NSUserDefaults.standardUserDefaults().valueForKey("serverUrl") as! String
        var JSON:NSMutableDictionary = NSMutableDictionary()
        var Str:String = "http://\(serverUrl)/api/likeplace"
        var params = ["userid":userid,"placeid":placeid]
        print(Str)
        Alamofire.request(.GET, Str, parameters:params).responseJSON() {
//            (_, _, data, _) in
//            if data != nil {
//                JSON = data! as! NSMutableDictionary
            data in
            if data.result.value != nil {
                JSON = data.result.value as! NSMutableDictionary
                print(JSON["response"])
                if JSON["response"] as! String == "added" {
                let alertController = UIAlertController(title: "", message:
                    "Место добавлено в закладки", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "", message:
                        "Место удалено из закладок", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                var st = NSUserDefaults.standardUserDefaults().valueForKey("userid") as! Double
                print("USERID: \(st)")
                var params = ["id":st]
                Alamofire.request(.GET, "http://\(serverUrl)/api/getfav", parameters:params).responseJSON() {
//                    (_, _, data, _) in
//                    if data != nil {
                    data in
                    if data.result.value != nil {
                        print("4:\(data)")
//                        NSUserDefaults.standardUserDefaults().setValue(data, forKey: "favplaces")
                        NSUserDefaults.standardUserDefaults().setValue(data.result.value, forKey: "favplaces")
                    }
                }

            }
            
        }
        
        
        
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
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
