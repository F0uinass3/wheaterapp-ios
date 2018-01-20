//
//  WALocation.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import SwiftyJSON

class WALocation : NSObject {
    
    var name: String = ""
    var countryName : String = ""
    var countryCode : String = ""
    
    var latitude : Double = 0
    var longitude : Double = 0
    var geonameId : Int64 = 0
    
    init(json: Any?) {
        super.init()
        if let j = json as? JSON {
            if let datas = j.dictionary {
                self.fetch(datas:datas)
            }
            
        } else if let datas = json as? Dictionary<String, JSON> {
            self.fetch(datas: datas)
        }
    }
       
    func fetch(datas: Dictionary<String, JSON>) {
        if let id =  datas["geonameId"]?.int64 {
            self.geonameId = id
        }
        if let n = datas["name"]?.string {
            self.name = n
        }
        if let cn = datas["countryName"]?.string {
            self.countryName = cn
        }
        if let cc = datas["countryCode"]?.string {
            self.countryCode = cc
        }
        if let lat = datas["lat"]?.string {
            if let d = Double(lat) {
                self.latitude = d
            }
        }
        if let long = datas["lng"]?.string {
            if let d = Double(long) {
                self.longitude = d
            }
        }
    }
    
    
    
    func toJSON() -> Dictionary<String, Any?> {
        return [
            "geonameId":self.geonameId,
            "name":self.name,
            "countryName":self.countryName,
            "countryCode":self.countryCode,
            "lat":String(self.latitude),
            "lng":String(self.longitude)
        ]
        
    }
}
