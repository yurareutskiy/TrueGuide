//
//  SearchPlaces.swift
//  TG app
//
//  Created by NikoGenn on 11.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit

class SearchPlaces: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    var JSON:NSMutableArray = NSUserDefaults.standardUserDefaults().objectForKey("places") as! NSMutableArray
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: "SearchPlacesCell", bundle: nil), forCellReuseIdentifier: "SearchPlacesCell")
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "reloadTablePl:",
            name:"reloadTablePl",
            object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: SearchPlacesCell = tableView.dequeueReusableCellWithIdentifier("SearchPlacesCell") as!SearchPlacesCell
        cell.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        var fields:NSMutableDictionary = JSON[indexPath.row]["fields"] as! NSMutableDictionary
        cell.title.text = fields["title"] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JSON.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSNotificationCenter.defaultCenter().postNotificationName("jumpToPlace", object: nil, userInfo:["message":JSON[indexPath.row]])
    }
     //MARK: - Navigation

        
    func reloadTablePl(notification:NSNotification)
    {
        let userInfo:Dictionary<String,NSMutableArray!> = notification.userInfo as! Dictionary<String,NSMutableArray!>
        let messageString = userInfo["message"]
        JSON = messageString!
        self.tableView.reloadData()
        
    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
