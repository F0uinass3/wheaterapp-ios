//
//  WALocationWheater.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import SwiftyJSON

class WALocationWheater : NSObject {
    
    
    var latitude : Double = 0
    var longitude : Double = 0
    var timezone : String? = nil
    
    var currently : WAWheaterDataGeneric? = nil
    var daily : WAWheaterDataDayGlobal? = nil
    var hourly : WAWheaterDataGlobal? = nil
    
    init(json: Any?) {  
        super.init()
        if let root = json as? JSON {
            if let datas = root.dictionary {
                self.fetch(datas: datas)
            }
        } else if let datas = json as? Dictionary<String, JSON> {
            self.fetch(datas: datas)
        }
    }
    
    private func fetch(datas: Dictionary<String, JSON>) {
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
    
    func toJSON() -> Dictionary<String, Any?> {
        return [
            "latitude" : self.latitude,
            "longitude" : self.longitude,
            "timezone" : self.timezone,
            "currently" : self.currently?.toJSON(),
            "daily" : self.daily?.toJSON(),
            "hourly" : self.daily?.toJSON()
        ]
    }
    

    
    
}
