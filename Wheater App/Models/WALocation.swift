//
//  WALocation.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation

class WALocation : NSObject {
    
    var name: String = ""
    var countryName : String = ""
    var countryCode : String = ""
    
    var latitude : Double = 0
    var longitude : Double = 0
    
    
    init(json: Any?) {
        super.init()
    }
}
