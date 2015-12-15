//
//  FavoritesView.swift
//  TG app
//
//  Created by NikoGenn on 12.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import PageMenu

class BookmarksVC: UIViewController {


    @IBOutlet weak var menuButton: UIBarButtonItem!
//    @IBOutlet var placeholderView: UIView!
//    @IBOutlet var topTopView: UIView!
//    @IBOutlet var topView: UIView!

//    var pageMenu : CAPSPageMenu?
//    var JSONPlaces:NSMutableArray = NSUserDefaults.standardUserDefaults().valueForKey("favplaces") as! NSMutableArray
//    var JSONRoutes:NSMutableArray = NSUserDefaults.standardUserDefaults().valueForKey("routes") as! NSMutableArray

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }

        /*
        topView.backgroundColor = UIColor(red: 0, green: 150/255, blue: 136/255, alpha: 1)
        topTopView.backgroundColor = UIColor(red: 0, green: 121/255, blue: 107/255, alpha: 1)
        // Do any additional setup after loading the view.
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        var controller : PlacesFavorites = PlacesFavorites(nibName: "PlacesFavorites", bundle: nil)
        controller.title = "Места"
        controllerArray.append(controller)
        
        var controller2 : RoutesFavorites = RoutesFavorites(nibName: "RoutesFavorites", bundle: nil)
        controller2.title = "Маршруты"
        controllerArray.append(controller2)
        
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
        // Do any additional setup after loading the view.
*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
