//
//  WALocationWheater.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import SwiftyJSON

class WALocationWheater : NSObject, NSCoding {
    
    
    var latitude : Double = 0
    var longitude : Double = 0
    var timezone : String? = nil
    
    var currently : WAWheaterDataGeneric = WAWheaterDataGeneric(json: nil)
    var daily : WAWheaterDataDayGlobal = WAWheaterDataDayGlobal(json: nil)
    var hourly : WAWheaterDataGlobal = WAWheaterDataGlobal(json: nil)
    
    init(json: Any?) {  
        super.init()
        if let root = json as? JSON {
            if let datas = root.dictionary {
                if let lt = datas["latitude"]?.double {
                    self.latitude = lt
                }
                if let lg = datas["longitude"]? .double {
                    self.longitude = lg
                }
                if let tz = datas["timezone"]?.string {
                    self.timezone = tz
                }
                if let curr = datas["currently"]?.dictionary {
                    self.currently = WAWheaterDataGeneric(json: curr)
                }
                if let dly = datas["daily"]?.dictionary {
                    self.daily = WAWheaterDataDayGlobal(json: dly)
                }
                if let hrly = datas["hourly"]?.dictionary {
                    self.hourly = WAWheaterDataGlobal(json: hrly)
                }
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        latitude = aDecoder.decodeDouble(forKey: "latitude")
        longitude = aDecoder.decodeDouble(forKey: "longitude")
        timezone = aDecoder.decodeObject(forKey: "timezone") as? String
        currently = aDecoder.decodeObject(forKey: "currently") as! WAWheaterDataGeneric
        daily = aDecoder.decodeObject(forKey: "daily") as! WAWheaterDataDayGlobal
        hourly = aDecoder.decodeObject(forKey: "hourly") as! WAWheaterDataGlobal
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(latitude, forKey: "latitude")
        aCoder.encode(longitude, forKey: "longitude")
        aCoder.encode(timezone, forKey: "timezone")
        aCoder.encode(currently, forKey: "currently")
        aCoder.encode(daily, forKey: "daily")
        aCoder.encode(hourly, forKey: "hourly")
    }
//    
//    func toJSON() -> Dictionary<String, Any?> {
//        return [
//            "latitude" : self.latitude,
//            "longitude" : self.longitude,
//            "timezone" : self.timezone,
//            "currently" : self.currently.toJSON(),
//            "daily" : self.daily.toJSON(),
//            "hourly" : self.hourly.toJSON()
//        ]
//    }
    

    
    
}
