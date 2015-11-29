//
//  PlacesFavorites.swift
//  TG app
//
//  Created by NikoGenn on 12.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit

class PlacesFavorites: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var JSONPlaces:NSMutableArray = NSUserDefaults.standardUserDefaults().valueForKey("favplaces") as! NSMutableArray
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerNib(UINib(nibName: "PlacesFavoritesCell", bundle: nil), forCellReuseIdentifier: "PlacesFavoritesCell")
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        self.tableView.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: PlacesFavoritesCell = tableView.dequeueReusableCellWithIdentifier("PlacesFavoritesCell") as!PlacesFavoritesCell
        cell.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 1)
        var fields:NSMutableDictionary = JSONPlaces[indexPath.row]["fields"] as! NSMutableDictionary
        cell.title.text = fields["title"] as? String
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return JSONPlaces.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 85
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
