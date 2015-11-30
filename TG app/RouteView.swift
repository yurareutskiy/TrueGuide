//
//  RouteView.swift
//  TG app
//
//  Created by NikoGenn on 06.06.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit

class RouteView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var goingB: UIButton!
    @IBOutlet var tableView: UITableView!
    internal var Info:NSDictionary = NSDictionary()
    var fields2:NSMutableDictionary = NSMutableDictionary()
    var fields3:Array<String> = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        //self.tableView.contentOffset.y = 0
        self.tableView.contentInset = UIEdgeInsetsZero
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.backgroundColor = UIColor.clearColor()
        // Do any additional setup after loading the view.
        print(Info)
        var fields:NSMutableDictionary = Info["message"] as! NSMutableDictionary
        fields2 = fields["fields"] as! NSMutableDictionary
        fields3 = Info["places"] as! Array<String>
        goingB.backgroundColor = UIColor(red: 0, green: 150/255, blue: 136/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            var cell = tableView.dequeueReusableCellWithIdentifier("header") as! RouteCell
            cell.backgroundColor = UIColor(white: 1, alpha: 0)
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.titleL.text = fields2["title"] as? String
            
            return cell
        default:
            var cell = tableView.dequeueReusableCellWithIdentifier("item") as! TimelineCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.title.text = fields3[indexPath.row-1]
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fields3.count+1
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 259
        default:
            return 45
        }
        
    }
    
    @IBAction func backB(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    

    @IBAction func iamGoing(sender: AnyObject) {
        var fields:NSMutableDictionary = Info["message"] as! NSMutableDictionary
        print(fields["pk"] as! Double)
        
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
