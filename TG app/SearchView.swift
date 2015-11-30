//
//  SearchView.swift
//  TG app
//
//  Created by NikoGenn on 11.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import PageMenu

class SearchView: UIViewController, UITextFieldDelegate {

    @IBOutlet var sortView: UIView!
    @IBOutlet var close: UIButton!
    @IBOutlet var underline: UIView!
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchField: UITextField!
    @IBOutlet var placeholderView: UIView!
    @IBOutlet var topTopView: UIView!
    @IBOutlet var topView: UIView!
    var tap: UITapGestureRecognizer!
    var pageMenu : CAPSPageMenu?
    var searchOpened:Bool = false
    var sortOpened:Bool = false
    var JSONPlaces:NSMutableArray = NSUserDefaults.standardUserDefaults().valueForKey("places") as! NSMutableArray
    var JSONCategories:NSMutableArray = NSUserDefaults.standardUserDefaults().valueForKey("categories") as! NSMutableArray
    var JSONRoutes:NSMutableArray = NSUserDefaults.standardUserDefaults().valueForKey("routes") as! NSMutableArray
    var Info:NSDictionary = NSDictionary()
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.backgroundColor = UIColor(red: 0, green: 150/255, blue: 136/255, alpha: 1)
        topTopView.backgroundColor = UIColor(red: 0, green: 121/255, blue: 107/255, alpha: 1)
        searchField.userInteractionEnabled = false
        searchField.tintColor = UIColor.whiteColor()
        tap = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        self.close.hidden = false
        self.sortView.hidden = true
        self.close.alpha = 0
        // Do any additional setup after loading the view.
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        var controller : SearchPlaces = SearchPlaces(nibName: "SearchPlaces", bundle: nil)
        controller.title = "Места"
        controller.view.frame.size.height = screenSize.height - 94
        controllerArray.append(controller)
        
        var controller2 : SearchCategories = SearchCategories(nibName: "SearchCategories", bundle: nil)
        controller2.title = "Категории"
        controllerArray.append(controller2)
        
        var controller3 : SearchRoutes = SearchRoutes(nibName: "SearchRoutes", bundle: nil)
        controller3.title = "Маршруты"
        controllerArray.append(controller3)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        var parameters: [String: AnyObject] = ["menuItemSeparatorWidth": 0,
            "useMenuLikeSegmentedControl": true,
            "menuItemSeparatorPercentageHeight": 0,
            "scrollMenuBackgroundColor": UIColor(red: 0, green: 150/255, blue: 136/255, alpha: 1),
            "selectionIndicatorColor": UIColor(red: 253/255, green: 192/255, blue: 46/255, alpha: 1),
            "unselectedMenuItemLabelColor": UIColor(white: 1, alpha: 0.5)]
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.placeholderView.frame.height), options: parameters)
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.placeholderView.addSubview(pageMenu!.view)
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "jumpToPlaceM:",
            name:"jumpToPlace",
            object: nil)
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "jumpToRouteM:",
            name:"jumpToRoute",
            object: nil)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        var JSON:NSMutableArray
//        switch pageMenu!.currentPageIndex{
//        case 0:
//            JSON = JSONPlaces
//        case 1:
//            JSON = JSONCategories
//        case 2:
//            JSON = JSONRoutes
//        default:
//            JSON = JSONPlaces
//        }
//        var tempJ:NSMutableArray = NSMutableArray()
//        for n in JSON {
//            let f:NSDictionary = n.valueForKey("fields") as! NSDictionary
//            let name:String = f.valueForKey("title") as! String
//            if (name.lowercaseString.rangeOfString(textField.text, options: NSStringCompareOptions.allZeros, range: nil, locale: nil) != nil){
//                tempJ.addObject(n)
//
//            }
//            NSNotificationCenter.defaultCenter().postNotificationName("reloadTablePl", object: nil, userInfo: ["message":tempJ])
//            
//        }
//        
//        
//        
//        
       return true
    }

    @IBAction func editing(sender: UITextField) {
        
        var JSON:NSMutableArray
        var notificationString:String
        switch pageMenu!.currentPageIndex{
        case 0:
            JSON = JSONPlaces
            notificationString = "reloadTablePl"
        case 1:
            JSON = JSONCategories
            notificationString = "reloadTableCat"
        case 2:
            JSON = JSONRoutes
            notificationString = "reloadTableRo"
        default:
            JSON = JSONPlaces
            notificationString = "reloadTablePl"
        }
        var tempJ:NSMutableArray = NSMutableArray()
        for n in JSON {
            let f:NSDictionary = n.valueForKey("fields") as! NSDictionary
            let name:String = f.valueForKey("title") as! String
            if (name.lowercaseString.rangeOfString(sender.text!.lowercaseString, options: NSStringCompareOptions(), range: nil, locale: nil) != nil){
                tempJ.addObject(n)
                
            }
            NSNotificationCenter.defaultCenter().postNotificationName(notificationString, object: nil, userInfo: ["message":tempJ])
            
        }
        
        if count(sender.text) == 0 {
            NSNotificationCenter.defaultCenter().postNotificationName(notificationString, object: nil, userInfo: ["message":JSON])
        }
        

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backB(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
        
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func dotsB(sender: AnyObject) {
        
        if sortOpened{
                closeSort()
                self.sortOpened = false
        } else {
                openSort()
                self.sortOpened = true
                self.placeholderView.addGestureRecognizer(tap)
        }
        
    }
    @IBAction func searchB(sender: AnyObject) {
        
        UIView.animateWithDuration(0.3, animations: {
           var searchB = self.searchButton.frame
            searchB.origin.x -= self.searchField.frame.size.width
            self.searchButton.frame = searchB
            var under = self.underline.frame
            under.size.width -= 200
            self.underline.frame = under
            self.searchButton.alpha = 0
            self.close.alpha = 1
            self.searchField.text = ""

            }, completion:{ finished in
                self.searchField.userInteractionEnabled = true
                self.searchField.becomeFirstResponder()
                self.searchOpened = true
                self.close.userInteractionEnabled = true
                self.searchButton.hidden = true

        })
        self.placeholderView.addGestureRecognizer(tap)
        

        
    }
    

    
    func DismissKeyboard(){
        self.searchField.resignFirstResponder()
        self.placeholderView.removeGestureRecognizer(tap)
        if self.searchField.text == "" {
            closeSearch()
        }
        if sortOpened{
            closeSort()
            self.sortOpened = false
        }
    }
    
    func closeSearch(){
        UIView.animateWithDuration(0.3, animations: {
            var searchB = self.searchButton.frame
            searchB.origin.x += self.searchField.frame.size.width
            self.searchButton.frame = searchB
            var under = self.underline.frame
            under.size.width = 0
            under.origin.x += 200
            self.underline.frame = under
            self.searchButton.alpha = 1
            self.close.alpha = 0
            }, completion:{ finished in
                self.searchField.text = "Справочник"
                self.searchField.userInteractionEnabled = false
                self.searchOpened = false
                self.close.userInteractionEnabled = false
                self.searchButton.hidden = false
        })
        var JSON:NSMutableArray
        var notificationString:String
        switch pageMenu!.currentPageIndex{
        case 0:
            JSON = JSONPlaces
            notificationString = "reloadTablePl"
        case 1:
            JSON = JSONCategories
            notificationString = "reloadTableCat"
        case 2:
            JSON = JSONRoutes
            notificationString = "reloadTableRo"
        default:
            JSON = JSONPlaces
            notificationString = "reloadTablePl"
        }
        NSNotificationCenter.defaultCenter().postNotificationName(notificationString, object: nil, userInfo: ["message":JSON])
        
    }

    
    @IBAction func closeB(sender: AnyObject) {
        self.searchField.resignFirstResponder()
        if !sortOpened{
            self.placeholderView.removeGestureRecognizer(tap)
        }
        closeSearch()
        
    }
    
    func closeSort(){
        //var transform:CGAffineTransform = CGAffineTransformScale(self.sortView.transform, 2.0, 2.0)
        UIView.animateWithDuration(0.3, animations: {
            //self.sortView.transform = transform
            self.sortView.alpha = 0
        }, completion:{ finished in
            self.sortView.hidden = true
            self.sortView.alpha = 1
        })
    }
    
    func openSort(){
        //var transform:CGAffineTransform = CGAffineTransformScale(self.sortView.transform, 2.0, 2.0)
        self.sortView.alpha = 0
        self.sortView.hidden = false
        UIView.animateWithDuration(0.3, animations: {
            self.sortView.alpha = 1
            //self.sortView.transform = transform
            }, completion:{ finished in
        })
    }
    
    func jumpToPlaceM(notification:NSNotification){
        
        self.Info = notification.userInfo!
        self.performSegueWithIdentifier("toPlace", sender: self)
        
    }
    
    func jumpToRouteM(notification:NSNotification){
        
        self.Info = notification.userInfo!
        self.performSegueWithIdentifier("toRoute", sender: self)
        
    }
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        switch segue.identifier!{
            case "toPlace":
                var Place:PlaceView = segue.destinationViewController as! PlaceView
                Place.Info = self.Info
            case "toRoute":
                var Route:RouteView = segue.destinationViewController as! RouteView
                Route.Info = self.Info
        default:
            print("")

        }
        
    }


}
