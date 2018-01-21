//
//  WAWheaterDataGeneric.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import SwiftyJSON

class WAWheaterDataGeneric : NSObject, NSCoding {
    
    var time : Date? = nil//1516442400,
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
    
    init(json: Any?) {
        if let datas = json as? Dictionary<String, JSON> {
            if let t = datas["time"]?.double {
                self.time = Date(timeIntervalSince1970: t)
            }
            if let sm = datas["summary"]?.string {
                self.summary = sm
            }
            if let ic = datas["icon"]?.string {
                self.icon = WAEnumConverter.convert(byString: ic)
            }
            if let pInt = datas["precipIntensity"]?.double {
                self.precipIntensity = pInt
            }
            if let pProb = datas["precipProbability"]?.double {
                self.precipProbability = pProb
            }
            if let pTyp = datas["precipType"]?.string {
                self.precipType = WAEnumConverter.convert(byString: pTyp)
            }
            if let tp = datas["temperature"]?.double {
                self.temperature = tp
            }
            if let apt = datas["apparentTemperature"]?.double {
                self.apparentTemperature = apt
            }
            if let dwp = datas["dewPoint"]?.double {
                self.dewPoint = dwp
            }
            if let hum = datas["humidity"]?.double {
                self.humidity = hum
            }
            if let press = datas["pressure"]?.double {
                self.pressure = press
            }
            if let wspd = datas["windSpeed"]?.double {
                self.windSpeed = wspd
            }
            if let wgst = datas["windGust"]?.double {
                self.windGust = wgst
            }
            if let wbrg = datas["windBearing"]?.int32 {
                self.windBearing = wbrg
            }
            if let cclv = datas["cloudCover"]?.double {
                self.cloudCover = cclv
            }
            if let uv = datas["uvIndex"]?.int32 {
                self.uvIndex = uv
            }
            if let visb = datas["visibility"]?.double {
                self.visibility = visb
            }
            if let ozn = datas["ozone"]?.double {
                self.ozone = ozn
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        if let t = aDecoder.decodeObject(forKey: "time") as? Double {
            time = Date(timeIntervalSince1970: t)
        }
        summary = aDecoder.decodeObject(forKey: "summary") as? String
        icon = WAEnumConverter.convert(byString: aDecoder.decodeObject(forKey: "icon") as! String)
        precipIntensity = aDecoder.decodeDouble(forKey: "precipIntensity")
        precipProbability = aDecoder.decodeDouble(forKey: "precipProbability")
        precipType = WAEnumConverter.convert(byString: aDecoder.decodeObject(forKey: "precipType") as! String)
        temperature = aDecoder.decodeDouble(forKey: "temperature")
        apparentTemperature = aDecoder.decodeDouble(forKey: "apparentTemperature")
        dewPoint = aDecoder.decodeDouble(forKey: "dewPoint")
        humidity = aDecoder.decodeDouble(forKey: "humidity")
        pressure = aDecoder.decodeDouble(forKey: "pressure")
        windSpeed = aDecoder.decodeDouble(forKey: "windSpeed")
        windGust = aDecoder.decodeDouble(forKey: "windGust")
        windBearing = aDecoder.decodeInt32(forKey: "windBearing")
        cloudCover = aDecoder.decodeDouble(forKey: "cloudCover")
        uvIndex = aDecoder.decodeInt32(forKey: "uvIndex")
        visibility = aDecoder.decodeDouble(forKey: "visibility")
        ozone = aDecoder.decodeDouble(forKey: "ozone")
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(time?.timeIntervalSince1970, forKey: "time")
        aCoder.encode(summary, forKey: "summary")
        aCoder.encode(WAEnumConverter.reverse(byIcon: icon), forKey: "icon")
        aCoder.encode(precipIntensity, forKey: "precipIntensity")
        aCoder.encode(precipProbability, forKey: "precipProbability")
        aCoder.encode(WAEnumConverter.reverse(byIcon: precipType), forKey: "precipType")
        aCoder.encode(temperature, forKey: "temperature")
        aCoder.encode(apparentTemperature, forKey: "apparentTemperature")
        aCoder.encode(dewPoint, forKey: "dewPoint")
        aCoder.encode(humidity, forKey: "humidity")
        aCoder.encode(pressure, forKey: "pressure")
        aCoder.encode(windSpeed, forKey: "windSpeed")
        aCoder.encode(windGust, forKey: "windGust")
        aCoder.encode(windBearing, forKey: "windBearing")
        aCoder.encode(cloudCover, forKey: "cloudCover")
        aCoder.encode(uvIndex, forKey: "uvIndex")
        aCoder.encode(visibility, forKey: "visibility")
        aCoder.encode(ozone, forKey: "ozone")
    }
}
