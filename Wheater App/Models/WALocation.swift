//
//  WALocation.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import SwiftyJSON

class WALocation : NSObject, NSCoding {
    
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
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        geonameId = aDecoder.decodeInt64(forKey: "geonameId")
        name = aDecoder.decodeObject(forKey: "name") as! String
        countryName = aDecoder.decodeObject(forKey: "countryName") as! String
        countryCode = aDecoder.decodeObject(forKey: "countryCode") as! String
        latitude = aDecoder.decodeDouble(forKey: "latitude")
        longitude = aDecoder.decodeDouble(forKey: "longitude")
    }
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(geonameId, forKey:"geonameId")
        aCoder.encode(name, forKey:"name")
        aCoder.encode(countryName, forKey:"countryName")
        aCoder.encode(countryCode, forKey:"countryCode")
        aCoder.encode(latitude, forKey:"latitude")
        aCoder.encode(longitude, forKey:"longitude")
    }

}
