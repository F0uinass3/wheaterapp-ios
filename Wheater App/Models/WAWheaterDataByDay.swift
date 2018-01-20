//
//  WAWheaterData.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation


class WAWheaterDataByDay : WAWheaterDataGeneric {

    
    //MARK: Daily custom
    var moonPhase : Double = 0 // 0.1,
    var apparentTemperatureHigh : Double = 0
    var apparentTemperatureHighTime : NSDate? = nil
    var apparentTemperatureLow : Double = 0
    var apparentTemperatureLowTime : NSDate? = nil
    var sunriseTime : NSDate? = nil //1516433796,
    var sunsetTime : NSDate? = nil //1516465784,
    var precipIntensityMax: Double = 0 //0.0434,
    var precipIntensityMaxTime : NSDate? = nil//1516438800,
    var temperatureHigh: Double = 0 // 52.66,
    var temperatureHighTime : Double = 0 //1516464000,
    var temperatureLow : Double = 0 //45.36,
    var temperatureLowTime : NSDate? = nil //1516518000,
    var windGustTime: NSDate? = nil//1516460400,
    var uvIndexTime : NSDate? = nil //1516446000,

    override init(json: Any) {
        super.init(json: json)
    }
}
