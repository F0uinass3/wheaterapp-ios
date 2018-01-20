//
//  WAWheaterDataDayGlobal.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation


class WAWheaterDataDayGlobal : NSObject {
    
    var summary : String = ""
    var icon : WAIconType = .none
    var data : Array<WAWheaterDataByDay> = Array<WAWheaterDataByDay>()
    
    init(json: Any?) {
        
    }
}
