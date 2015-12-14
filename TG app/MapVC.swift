//
//  Map.swift
//  TG app
//
//  Created by NikoGenn on 06.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import QuartzCore
import Alamofire
import MapKit
import SWRevealViewController

class MapVC: UITableViewController {

    @IBOutlet weak var menuButton: UIBarButtonItem!
//    @IBOutlet var burgerB: UIButton!
//    @IBOutlet var mapView: MKMapView!
//    @IBOutlet weak var mapView: MKMapView!
//    @IBOutlet var topTopView: UIView!
//    @IBOutlet var tableView: UITableView!
//    @IBOutlet var topView: UIView!
    var opened:Bool = false
    var disappeared:Bool = false
    var titleLa:String = ""
    var adress:String?
    var icon:UIImage?
//    var a:CGFloat!
    var closeRow: UIButton!
    var user:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var JSON:NSMutableArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        print("MAP VC")
        //
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        //tableView.separatorColor = UIColor(white: 1, alpha: 0)
//        tableView.backgroundColor = UIColor(white: 1, alpha: 0)
//        topView.backgroundColor = UIColor(red: 0, green: 150/255, blue: 136/255, alpha: 1)
//        topTopView.backgroundColor = UIColor(red: 0, green: 121/255, blue: 107/255, alpha: 1)
//        var reveal:SWRevealViewController = self.revealViewController()
//        burgerB.addTarget(self.revealViewController(), action: Selector("revealToggle:"), forControlEvents: UIControlEvents.TouchUpInside)
//        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        //let screenSize: CGRect = UIScreen.mainScreen().bounds
        //tableView.scrollRectToVisible(CGRectMake(0, 0, -(screenSize.height - 270), 1), animated: false)
        //mapView.frame.size.height = screenSize.height - 270
        
        
//        closeRow = UIButton(frame: CGRectMake(self.view.frame.origin.x, self.view.frame.size.height-100, self.view.frame.size.width, 100))
//        var locationPickerView: LocationPickerView = LocationPickerView(frame: self.view.frame)
//        locationPickerView.tableViewDelegate = self
//        locationPickerView.tableViewDataSource = self
//        locationPickerView.defaultMapHeight = self.view.frame.height-300
//        locationPickerView.shouldCreateHideMapButton = true
//        locationPickerView.pullToExpandMapEnabled = true
//        locationPickerView.setCustomCloseButton(closeRow, atPoint: CGPoint(x: 0, y: self.view.frame.size.height-100))
//
//        self.view.addSubview(locationPickerView)
//        self.view.addSubview(topView)
        
//        JSON = NSUserDefaults.standardUserDefaults().objectForKey("places") as! NSMutableArray
        

        
    }
    
    override func viewDidAppear(animated: Bool) {
//        var cell1: FirstCell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)) as! FirstCell
//        var fields:NSMutableDictionary = JSON[0]["fields"] as! NSMutableDictionary
//        titleLa = fields["title"] as! String
//        print(titleLa)
//        adress = cell1.adress.text!
//        icon = cell1.icon.image!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return JSON.count + 1
//        return 50
        return 10
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 70
      //  /*
        if opened{
            if indexPath.row == 0 {
                let screenSize: CGRect = UIScreen.mainScreen().bounds
                return screenSize.height - 125
            } else
                if indexPath.row == 1 {
                    return 125
                }
                else {
                    return 0
            }
        } else {
            if indexPath.row == 0 {
                let screenSize: CGRect = UIScreen.mainScreen().bounds
                return screenSize.height - 270
            } else
                if indexPath.row == 1 {
                    return 70
                }
                else {
                    return 70
            }
        }
//*/
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row{
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("MapCell") as! MapCell
            cell.backgroundColor = UIColor(white: 1, alpha: 0)
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
//            var cell = tableView.dequeueReusableCellWithIdentifier("mapCell") as! MapCell
        case 1:
            let cell = tableView.dequeueReusableCellWithIdentifier("firstCell") as! FirstCell
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.clipsToBounds = false
            cell.contentView.clipsToBounds = false
//            if !opened {
//            var fields:NSMutableDictionary = JSON[0]["fields"] as! NSMutableDictionary
//            cell.titleL.text = fields["title"] as? String
//            }
            return cell
        default:
            let cell = tableView.dequeueReusableCellWithIdentifier("nextCell") as! OtherCell
//            var fields:NSMutableDictionary = JSON[indexPath.row - 1]["fields"] as! NSMutableDictionary
//            cell.titleL.text = fields["title"] as? String
            //cell.titleL.text = "Парк Горького #\(indexPath.row)"
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            return cell
        }
        
    }
    
    /*
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        if (tableView.indexPathsForVisibleRows() as? [NSIndexPath] == nil)
//        {
//            if indexPath.row == 1{
//                var cell1: FirstCell = tableView.cellForRowAtIndexPath(indexPath) as FirstCell
//                titleL = cell1.titleL.text
//                adress = cell1.adress.text
//                icon = cell1.icon.image
//                disappeared = true
//            }
//        }
        
    }
    */
    /*
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1{
            disappeared = false
        }
    }
    */
    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(titleLa)
        switch indexPath.row{
        case 0:
            print("MapSelected")
        case 1:
            print("First")
            if !opened{
                animateCells()
            } else {
                var cell1: FirstCell = tableView.cellForRowAtIndexPath(indexPath) as! FirstCell
                cell1.titleL.text = titleLa
                cell1.adress.text = adress
                cell1.icon.image = icon
                animateCells()
            }
        default:
            print("Other")
            //if disappeared{
                
            //} else {
            animateCellsWithChange(indexPath)
            //}
        }
    }
    */
    /*
    func animateCellsWithChange(index: NSIndexPath){
        var cell1: FirstCell? = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)) as? FirstCell
        var cell2: OtherCell = tableView.cellForRowAtIndexPath(index) as! OtherCell
        if cell1 != nil{
            titleLa = cell1!.titleL.text!
            cell1!.titleL.text = cell2.titleL.text!
            adress = cell1!.adress.text!
            cell1!.adress.text = cell2.adress.text
            icon = cell1!.icon.image!
            cell1!.icon.image = cell2.icon.image
            animateCells()
        } else{
            if opened{
                opened = false
                tableView.scrollEnabled = true
            } else {
                opened = true
                tableView.scrollEnabled = false
            }
            disappeared = false
            tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition:UITableViewScrollPosition.Top, animated: false)
            var cell1: FirstCell? = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 1, inSection: 0)) as? FirstCell
            cell1!.titleL.text = cell2.titleL.text
            cell1!.adress.text = cell2.adress.text
            cell1!.icon.image = cell2.icon.image
            tableView.reloadData()
            let animation = CATransition()
            animation.type = kCATransitionPush
            animation.subtype = kCATransitionFade
            animation.duration = 0.5
            self.view.layer.addAnimation(animation, forKey: "UITableViewReloadDataAnimationKey")
        }
        
    }
    */
    /*
    func animateCells(){
        if opened{
            opened = false
            tableView.scrollEnabled = true
        } else {
            opened = true
            tableView.scrollEnabled = false
        }
        disappeared = false
        tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition:UITableViewScrollPosition.Top, animated: false)
        //tableView.setContentOffset(CGPointZero, animated: true)
        tableView.reloadData()
        let animation = CATransition()
        animation.type = kCATransitionPush
        animation.subtype = kCATransitionFade
        animation.duration = 0.5
        self.view.layer.addAnimation(animation, forKey: "UITableViewReloadDataAnimationKey")
        
    }
    */
    
//    @IBAction func burgerT(sender: AnyObject) {
//        self.findHamburguerViewController()?.showMenuViewController()
//    }
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//        if (scrollView.contentOffset.y < a)
//        {
//            scrollView.setContentOffset(CGPointMake(0, a), animated:false)
//            scrollView.scrollEnabled = false
//
//        }
//        scrollView.scrollEnabled = true
//    }
//
//    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
//        a = scrollView.contentOffset.y
//        println(a)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
