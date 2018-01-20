//
//  WAWheaterData.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import SwiftyJSON

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
    var temperatureHighTime : NSDate? = nil //1516464000,
    var temperatureLow : Double = 0 //45.36,
    var temperatureLowTime : NSDate? = nil //1516518000,
    var windGustTime: NSDate? = nil//1516460400,
    var uvIndexTime : NSDate? = nil //1516446000,

    override init(json: Any?) {
        super.init(json: json)
        if let datas = json as? Dictionary<String, JSON> {
            if let mphs = datas["moonPhase"]?.double {
                self.moonPhase = mphs
            }
            if let ath = datas["apparentTemperatureHigh"]?.double {
                self.apparentTemperatureHigh = ath
            }
            if let athm = datas["apparentTemperatureHighTime"]?.double {
                self.apparentTemperatureHighTime = NSDate(timeIntervalSince1970: athm)
            }
            if let atl = datas["apparentTemperatureLow"]?.double {
                self.apparentTemperatureLow = atl
            }
            if let atlt = datas["apparentTemperatureLowTime"]?.double {
                self.apparentTemperatureLowTime = NSDate(timeIntervalSince1970: atlt)
            }
            if let snrt = datas["sunriseTime"]?.double {
                self.sunriseTime = NSDate(timeIntervalSince1970: snrt)
            }
            if let snst = datas["sunsetTime"]?.double {
                self.sunsetTime = NSDate(timeIntervalSince1970: snst)
            }
            if let pim = datas["precipIntensityMax"]?.double {
                self.precipIntensityMax = pim
            }
            if let pimt = datas["precipIntensityMaxTime"]?.double {
                self.precipIntensityMaxTime = NSDate(timeIntervalSince1970: pimt)
            }
            if let th = datas["temperatureHigh"]?.double {
                self.temperatureHigh = th
            }
            if let tht = datas["temperatureHighTime"]?.double {
                self.temperatureHighTime = NSDate(timeIntervalSince1970: tht)
            }
            if let tl = datas["temperatureLow"]?.double {
                self.temperatureLow = tl
            }
            if let tlt = datas["temperatureLowTime"]?.double {
                self.temperatureLowTime = NSDate(timeIntervalSince1970: tlt)
            }
            if let wgt = datas["windGustTime"]?.double {
                self.windGustTime = NSDate(timeIntervalSince1970: wgt)
            }
            if let uvt = datas["uvIndexTime"]?.double {
                self.uvIndexTime = NSDate(timeIntervalSince1970: uvt)
            }
        }
    }
    
    override func toJSON() -> Dictionary<String, Any?> {
        var sup = super.toJSON()
        sup["moonPhase"] = self.moonPhase
        sup["apparentTemperatureHigh"] = self.apparentTemperatureHigh
        sup["apparentTemperatureHighTime"] = self.apparentTemperatureHighTime?.timeIntervalSince1970
        sup["apparentTemperatureLow"] = self.apparentTemperatureLow
        sup["apparentTemperatureLowTime"] = self.apparentTemperatureLowTime?.timeIntervalSince1970
        sup["sunriseTime"] = self.sunriseTime?.timeIntervalSince1970
        sup["sunsetTime"] = self.sunsetTime?.timeIntervalSince1970
        sup["precipIntensityMax"] = self.precipIntensityMax
        sup["precipIntensityMaxTime"] = self.precipIntensityMaxTime?.timeIntervalSince1970
        sup["temperatureHigh"] = self.temperatureHigh
        sup["temperatureHighTime"] = self.temperatureHighTime?.timeIntervalSince1970
        sup["temperatureLow"] = self.temperatureLow
        sup["temperatureLowTime"] = self.temperatureLowTime?.timeIntervalSince1970
        sup["windGustTime"] = self.windGustTime
        sup["uvIndexTime"] = self.uvIndexTime
        return sup
    }
}
