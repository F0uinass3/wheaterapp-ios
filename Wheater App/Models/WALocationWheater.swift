//
//  WALocationWheater.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation

class WALocationWheater : NSObject {
    
    
    var latitude : Double = 0
    var longitude : Double = 0
    var timezone : String = ""
    var updatedOn : NSDate? = nil
    
    var currently : WAWheaterDataGeneric? = nil
    var daily : WAWheaterDataDayGlobal? = nil
    var hourly : WAWheaterDataGlobal? = nil
    
    init(json: Any) {
        super.init()
    }
}
