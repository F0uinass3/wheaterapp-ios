//
//  WAWheaterDataGlobal.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation

class WAWheaterDataGlobal : NSObject {
    
    
    var summary : String = ""
    var icon : WAIconType = .none
    var data : Array<WAWheaterDataGeneric> = Array<WAWheaterDataGeneric>()
    
    init(json: Any) {
    }
}
