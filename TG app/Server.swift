//
//  Server.swift
//  TG app
//
//  Created by NikoGenn on 17.05.15.
//  Copyright (c) 2015 MyMac. All rights reserved.
//

import UIKit
import Alamofire


class Server: NSObject {
    let serverUrl = NSUserDefaults.standardUserDefaults().valueForKey("serverUrl")!


    func test(){

        var JSON:NSMutableArray = NSMutableArray()
        Alamofire.request(.GET, "http://\(serverUrl)/api/").responseJSON() {
            (_, _, data, _) in
            JSON = data! as! NSMutableArray
            println(JSON[0]["fields"])
        }
    }
    
    func registerFB(id:String, firstName:String, lastName:String){

        var JSON:NSMutableDictionary = NSMutableDictionary()
        var Str:String = "http://\(serverUrl)/api/regfb"
        var params = ["id":id,"name":firstName, "lastname":lastName]
        println(Str)
        Alamofire.request(.GET, Str, parameters:params).responseJSON() {
            (_, _, data, _) in
            if data != nil {
                JSON = data! as! NSMutableDictionary
                println(JSON["response"])
                var t = JSON["response"] as! Double
                NSUserDefaults.standardUserDefaults().setValue(t, forKey: "userid")
            }
            
        }
    }
    
    func getPlaces(){
        Alamofire.request(.GET, "http://\(serverUrl)/api/getplaces").responseJSON() {
            (_, _, data, error) in
            var JSON = data as? NSMutableArray
            
        }
    }
    
    func addToFav(userid:Double, placeid:Double){
        
        var JSON:NSMutableDictionary = NSMutableDictionary()
        var Str:String = "http://\(serverUrl)/api/likeplace"
        var params = ["userid":userid,"placeid":placeid]
        println(Str)
        Alamofire.request(.GET, Str, parameters:params).responseJSON() {
            (_, _, data, _) in
            if data != nil {
                JSON = data! as! NSMutableDictionary
                println(JSON["response"])
            }
            
        }
    }
}
