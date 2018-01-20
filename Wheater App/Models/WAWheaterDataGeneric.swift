//
//  WAWheaterDataGeneric.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation


class WAWheaterDataGeneric : NSObject {
    
    var time : NSDate? = nil//1516442400,
    var summary : String? = nil//"Pluie Faible",
    var icon : WAIconType = .none
    var precipIntensity : Double = 0//0.0328,
    var precipProbability : Double = 0//0.77,
    var precipType : WAPrecipType = .none
    var temperature : Double = 0// 42.89,
    var apparentTemperature : Double = 0//36.87 ,
    var dewPoint : Double = 0//41.72,
    var humidity : Double = 0 //0.96,
    var pressure : Double = 0 //1001.51,
    var windSpeed : Double = 0//10.93,
    var windGust : Double = 0//26.48,
    var windBearing : Int32 = 0//207,
    var cloudCover : Double = 0 //0.79,
    var uvIndex : Int32 = 0//0,
    var visibility : Double = 0//5.97,
    var ozone : Double = 0//351.34
    
    init(json: Any) {
        
    }
}
