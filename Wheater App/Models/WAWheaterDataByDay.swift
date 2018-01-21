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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        moonPhase = aDecoder.decodeDouble(forKey: "moonPhase")
        if let atht = aDecoder.decodeObject(forKey: "apparentTemperatureHighTime") as? Double {
            apparentTemperatureHighTime = NSDate(timeIntervalSince1970: atht)
        }
        if let atlt = aDecoder.decodeObject(forKey: "apparentTemperatureLowTime") as? Double {
            apparentTemperatureLowTime = NSDate(timeIntervalSince1970: atlt)
        }
        
        if let snrt = aDecoder.decodeObject(forKey: "sunriseTime") as? Double {
            sunriseTime = NSDate(timeIntervalSince1970: snrt)
        }
        
        if let snst = aDecoder.decodeObject(forKey: "sunsetTime") as? Double {
            sunsetTime = NSDate(timeIntervalSince1970: snst)
        }
        if let pimt = aDecoder.decodeObject(forKey: "precipIntensityMaxTime") as? Double {
            precipIntensityMaxTime = NSDate(timeIntervalSince1970: pimt)
        }
        if let tht = aDecoder.decodeObject(forKey: "temperatureHighTime") as? Double {
            temperatureHighTime = NSDate(timeIntervalSince1970: tht)
        }
        if let tlt = aDecoder.decodeObject(forKey: "temperatureLowTime") as? Double {
            temperatureLowTime = NSDate(timeIntervalSince1970: tlt)
        }
        if let wgt = aDecoder.decodeObject(forKey: "windGustTime") as? Double {
            windGustTime = NSDate(timeIntervalSince1970: wgt)
        }
        if let uvt = aDecoder.decodeObject(forKey: "uvIndexTime") as? Double {
            uvIndexTime = NSDate(timeIntervalSince1970: uvt)
        }
        
        
        apparentTemperatureHigh = aDecoder.decodeDouble(forKey: "apparentTemperatureHigh")
        apparentTemperatureLow = aDecoder.decodeDouble(forKey: "apparentTemperatureLow")
        precipIntensityMax = aDecoder.decodeDouble(forKey: "precipIntensityMax")
        temperatureHigh = aDecoder.decodeDouble(forKey: "temperatureHigh")
        temperatureLow = aDecoder.decodeDouble(forKey: "temperatureLow")
    }
    
    override public func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(moonPhase, forKey: "moonPhase")
        aCoder.encode(apparentTemperatureHigh, forKey: "apparentTemperatureHigh")
        aCoder.encode(apparentTemperatureHighTime?.timeIntervalSince1970, forKey: "apparentTemperatureHighTime")
        aCoder.encode(apparentTemperatureLow, forKey: "apparentTemperatureLow")
        aCoder.encode(apparentTemperatureLowTime?.timeIntervalSince1970, forKey: "apparentTemperatureLowTime")
        aCoder.encode(sunriseTime?.timeIntervalSince1970, forKey: "sunriseTime")
        aCoder.encode(sunsetTime?.timeIntervalSince1970, forKey: "sunsetTime")
        aCoder.encode(precipIntensityMax, forKey: "precipIntensityMax")
        aCoder.encode(precipIntensityMaxTime?.timeIntervalSince1970, forKey: "precipIntensityMaxTime")
        aCoder.encode(temperatureHigh, forKey: "temperatureHigh")
        aCoder.encode(temperatureHighTime?.timeIntervalSince1970, forKey: "temperatureHighTime")
        aCoder.encode(temperatureLow, forKey: "temperatureLow")
        aCoder.encode(temperatureLowTime?.timeIntervalSince1970, forKey: "temperatureLowTime")
        aCoder.encode(windGustTime?.timeIntervalSince1970, forKey: "windGustTime")
        aCoder.encode(uvIndexTime?.timeIntervalSince1970, forKey: "uvIndexTime")
    }
    
}
