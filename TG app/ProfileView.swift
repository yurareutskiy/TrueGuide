//
//  ProfileView.swift
//  TG app
//
//  Created by NikoGenn on 11.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import Kingfisher

class ProfileView: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var balck: UIView!
    var circle:Bool = false
    @IBOutlet var backCircle: UIImageView!
    var backHidden:Bool = false
    @IBOutlet var back: UIButton!
    @IBOutlet var tableView: UITableView!
    var a:CGFloat = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //avatar.image = UIImage(data: NSData(contentsOfURL: NSURL(string: "https://c1.staticflickr.com/7/6217/6357645479_b6d8c2d367_z.jpg")!)!)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        //self.tableView.contentOffset.y = 0
        self.tableView.contentInset = UIEdgeInsetsZero
        self.automaticallyAdjustsScrollViewInsets = false
        self.tableView.backgroundColor = UIColor.clearColor()

    }
    
    override func viewDidAppear(animated: Bool) {
        self.tableView.contentOffset.y = 0

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backB(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    @IBAction func plusB(sender: AnyObject) {
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            var cell = tableView.dequeueReusableCellWithIdentifier("header") as! ProfileCell
            cell.backgroundColor = UIColor(white: 1, alpha: 0)
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            let fbU = NSUserDefaults.standardUserDefaults().valueForKey("FBUserID") as! String
            cell.avatar.kf_setImageWithURL(NSURL(string: "https://graph.facebook.com/\(fbU)/picture?type=large")!)
            cell.avatar.layer.cornerRadius = 5
            cell.username.text = NSUserDefaults.standardUserDefaults().valueForKey("firstName") as! String
            
            return cell
        default:
            var cell = tableView.dequeueReusableCellWithIdentifier("item") as! TimelineCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.title.text = "Place #\(indexPath.row)"
            return cell
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 232
        default:
            return 45
        }

    }
    
    func hideBack(){
        UIView.animateWithDuration(0.3, animations: {
            
            self.back.alpha = 0;
            if self.circle{
                self.backCircle.alpha = 0;
            }
            
            }
            , completion: {finished in
                
                self.back.hidden = true
                self.backHidden = true
        })
    }
    
    func showBack(){
        self.back.hidden = false
        UIView.animateWithDuration(0.3, animations: {
            
            self.back.alpha = 1;
            if self.circle{
                self.backCircle.alpha = 1;

            }
            }
            , completion: {finished in
                self.backHidden = false
                
        })
        
    }
    
    func isRowZeroVisible() -> Bool {
        var indexes:NSArray = tableView.indexPathsForVisibleRows!
        for item in indexes {
            var index = item as! NSIndexPath
            if (index.row == 0) {
                return true
    }
    }
    
    return false
    }
    
        func scrollViewDidScroll(scrollView: UIScrollView) {
            if isRowZeroVisible(){
            var visibleCells = self.tableView.cellForRowAtIndexPath(NSIndexPath(forItem: 0, inSection: 0))
            var cell = visibleCells as! ProfileCell
                cell.cellOnTableView(self.tableView, didScrollOnView: self.view)
            }
            if scrollView.contentOffset.y < 60
            {
                self.circle = false
                if self.backCircle.alpha == 1{
                    UIView.animateWithDuration(0.3, animations: {
                        self.backCircle.alpha = 0
                    }, completion: {finished in
                    })
                }
                UIView.animateWithDuration(0.3, animations: {
                    self.balck.alpha = 0
                    }, completion: {finished in
                })
            } else
            {
                UIView.animateWithDuration(0.3, animations: {
                    self.balck.alpha = 0.5
                    }, completion: {finished in
                })
                self.circle = true
            }
            if (scrollView.contentOffset.y < a || scrollView.contentOffset.y < 40)
            {
                //scrollView.setContentOffset(CGPointMake(0, a), animated:false)
                print("UP")
                showBack()
            } else
            {
                if !backHidden
                {
                    hideBack()
                }
                print("DOWN")
            }
        }
    
    
    
        func scrollViewWillBeginDragging(scrollView: UIScrollView) {
            a = scrollView.contentOffset.y
            print(a)
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
