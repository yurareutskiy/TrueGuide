//
//  CameraView.swift
//  TG app
//
//  Created by NikoGenn on 23.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit

class CameraView: UIViewController, CACameraSessionDelegate {

    @IBOutlet var frameV: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var camera:CameraSessionView = CameraSessionView(frame: self.view.frame)
        camera.delegate = self
        camera.setTopBarColor(UIColor(red: 0, green: 150/255, blue: 136/255, alpha: 1))
        self.view.addSubview(camera)
        self.view.addSubview(frameV)
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(
            self,
            selector: "closedCam",
            name:"CloseCam",
            object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didCaptureImage(image: UIImage!) {
        //
    }
    func closedCam() {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
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
