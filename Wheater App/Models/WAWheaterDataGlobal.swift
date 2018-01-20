//
//  WAWheaterDataGlobal.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import SwiftyJSON
class WAWheaterDataGlobal : NSObject {
    
    
    var summary : String = ""
    var icon : WAIconType = .none
    var data : Array<WAWheaterDataGeneric> = Array<WAWheaterDataGeneric>()
    
    init(json: Any?) {
        super.init()
        if let datas = json as? Dictionary<String, JSON> {
            self.fetch(datas: datas)
        }
    }
    
    private func fetch(datas:Dictionary<String, JSON>) {
        if let sm = datas["summary"]?.string {
            self.summary = sm
        }
        if let ic = datas["icon"]?.string {
            self.icon = WAEnumConverter.convert(byString: ic)
        }
        if let arr = datas["data"]?.array {
            for i in arr {
                data.append(WAWheaterDataGeneric(json: i.dictionary))
            }
        }
    }
    
    func toJSON() -> Dictionary<String, Any?> {
        return [
            "summary" : self.summary,
            "icon" : WAEnumConverter.reverse(byIcon: self.icon),
            "data" : self.data.map({ $0.toJSON() })
        ]
    }
}
