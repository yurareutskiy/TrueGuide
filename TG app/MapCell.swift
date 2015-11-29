//
//  MapCell.swift
//  TG app
//
//  Created by NikoGenn on 07.04.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapCell: UITableViewCell, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var locateB: UIButton!
    var didUpdated:Bool = false
    var userLocate:MKUserLocation!
    var location:CLLocationManager = CLLocationManager()
    var user:NSUserDefaults = NSUserDefaults.standardUserDefaults()
    @IBOutlet var mapView: MKMapView!
    override func awakeFromNib() {
        super.awakeFromNib()
        mapView.delegate = self
        //let screenSize: CGRect = UIScreen.mainScreen().bounds
        //mapView.frame = CGRectMake(0, 0, mapView.frame.size.width, screenSize.height - 270)
        //mapView.frame = self.frame
        location.delegate = self
        location.desiredAccuracy = kCLLocationAccuracyBest
        if location.respondsToSelector(Selector("requestWhenInUseAuthorization")) {
            location.requestWhenInUseAuthorization()
        }
        location.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    

    func mapView(mapView: MKMapView!, didFailToLocateUserWithError error: NSError!) {
        locateB.setImage(UIImage(named: "locateicoFailed"), forState: UIControlState.Normal)
        locateB.setImage(UIImage(named: "locateicoFailed"), forState: UIControlState.Selected)
    }
    
    
    func mapViewWillStartLocatingUser(mapView: MKMapView!) {
        var status: CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.NotDetermined {
            println("not determined")
            location.requestWhenInUseAuthorization()
        } else if status == CLAuthorizationStatus.Denied {
            println("Denied")
            locateB.setImage(UIImage(named: "locateicoFailed"), forState: UIControlState.Normal)
            locateB.setImage(UIImage(named: "locateicoFailed"), forState: UIControlState.Selected)
        } else if status == CLAuthorizationStatus.AuthorizedWhenInUse
        {
            println("Allowed")
            locateB.setImage(UIImage(named: "locateico"), forState: UIControlState.Normal)
            locateB.setImage(UIImage(named: "locateico"), forState: UIControlState.Selected)
        }
        
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        var identifier: NSString = "currentLocation"
        var pulsingView: SVPulsingAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier as String) as? SVPulsingAnnotationView
        if pulsingView == nil{
            pulsingView = SVPulsingAnnotationView(annotation: annotation, reuseIdentifier: identifier as String)
            pulsingView!.annotationColor = UIColor(red: 0, green: 150/255, blue: 136/255, alpha: 1)
        }
        pulsingView!.canShowCallout = true
        return pulsingView
        
    }
    
    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        userLocate = userLocation
        if !didUpdated{
            if userLocate != nil{
                var myRegion:MKCoordinateRegion = MKCoordinateRegion(center: userLocate.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
                mapView.setRegion(myRegion, animated: true)
            }
            didUpdated = true

        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func locatePressed(sender: AnyObject) {
        if userLocate != nil{
        var myRegion:MKCoordinateRegion = MKCoordinateRegion(center: userLocate.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        mapView.setRegion(myRegion, animated: true)
        }
        
    }

}
