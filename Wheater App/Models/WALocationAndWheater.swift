//
//  WALocationAndWheater.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import SwiftyJSON


class WALocationAndWheater : NSObject, NSCoding {
    var location : WALocation? = nil
    var wheater : WALocationWheater? = nil
    
    init(json: Any?) {
        super.init()
        if let root = json as? JSON {
            if let datas = root.dictionary {
                if let loc = datas["location"]?.dictionary {
                    self.location = WALocation(json: loc)
                }
                if let wht = datas["wheater"]?.dictionary {
                    self.wheater = WALocationWheater(json: wht)
                }
            }
        }
    }
    
    init(location:WALocation) {
        super.init()
        self.location = location
    }
    
    init(location: WALocation, wheater: WALocationWheater) {
        super.init()
        self.location = location
        self.wheater = wheater
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let loc = aDecoder.decodeObject(forKey: "location") as? WALocation {
            location = loc
        }
        if let wh = aDecoder.decodeObject(forKey: "wheater") as? WALocationWheater {
            wheater = wh
        }
        
    }
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(location, forKey: "location")
        aCoder.encode(wheater, forKey: "wheater")
    }
}


