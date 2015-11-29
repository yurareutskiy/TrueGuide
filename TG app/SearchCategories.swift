//
//  SearchCategories.swift
//  TG app
//
//  Created by NikoGenn on 11.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit

class SearchCategories: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var JSON:NSMutableArray = NSUserDefaults.standardUserDefaults().objectForKey("categories") as! NSMutableArray
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: "SearchCategoriesCell", bundle: nil), forCellReuseIdentifier: "SearchCategoriesCell")
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "reloadTableCat:",
            name:"reloadTableCat",
            object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: SearchCategoriesCell = tableView.dequeueReusableCellWithIdentifier("SearchCategoriesCell") as!SearchCategoriesCell
        var fields:NSMutableDictionary = JSON[indexPath.row]["fields"] as! NSMutableDictionary
        cell.title.text = fields["title"] as? String
        var c = fields["placeid"] as? NSArray
        switch c!.count{
            case 0:
                cell.countP.text = "Мест нет"
            case 1:
                cell.countP.text = "1 место"
            case 2:
                cell.countP.text = "2 места"
            case 3:
                cell.countP.text = "3 места"
            case 4:
                cell.countP.text = "4 места"
            default:
                cell.countP.text = "\(c!.count) мест"
        }
        cell.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JSON.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 145
    }
    
    func reloadTableCat(notification:NSNotification)
    {
        let userInfo:Dictionary<String,NSMutableArray!> = notification.userInfo as! Dictionary<String,NSMutableArray!>
        let messageString = userInfo["message"]
        JSON = messageString!
        self.tableView.reloadData()
        
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
