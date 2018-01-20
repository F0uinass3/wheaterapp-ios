//
//  WALocationAndWheater.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import SwiftyJSON


class WALocationAndWheater : NSObject {
    var location : WALocation? = nil
    var wheater : WALocationWheater? = nil
    
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
    
    init(location: WALocation, wheater: WALocationWheater) {
        super.init()
        self.location = location
        self.wheater = wheater
    }
    
    private func fetch(datas: Dictionary<String, JSON>) {
        if let loc = datas["location"]?.dictionary {
            self.location = WALocation(json: loc)
        }
        if let wht = datas["wheater"]?.dictionary {
            self.wheater = WALocationWheater(json: wht)
        }
    }
    
    func toJSON() -> Dictionary<String, Any?> {
        return [
            "location":self.location?.toJSON(),
            "wheater" : self.wheater?.toJSON()
        ]
    }
}


