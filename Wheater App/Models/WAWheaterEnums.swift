//
//  WAWheaterEnums.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation

//
//clear-day, clear-night, rain, snow, sleet, wind, fog, cloudy, partly-cloudy-day, or partly-cloudy-night
enum WAIconType {
    case none
    
    case clearday
    case clearnight
    case rain
    case snow
    case sleet
    case wind
    case fog
    case cloudy
    case partlycloudyday
    case partlycloudynight
    
}

enum WAPrecipType {
    case none
    
    case rain
    case snow
    case sleet
}

class WAEnumConverter {
    static func convert(byString val:String) -> WAIconType {
        switch val {
        case "clear-day":
            return .clearday
        case "clear-night" :
            return .clearnight
        case "rain":
            return .rain
        case "snow":
            return .snow
        case "sleet":
            return .sleet
        case "wind":
            return .wind
        case "fog":
            return .fog
        case "cloudy":
            return .cloudy
        case "partly-cloudy-day":
            return .partlycloudyday
        case "partly-cloudy-night":
            return .partlycloudynight
        default:
            return .none
        }
        
    }
    static func reverse(byIcon ic:WAIconType) -> String {
        switch ic {
        case .clearday:
            return "clear-day"
        case .clearnight :
            return "clear-night"
        case .rain:
            return "rain"
        case .snow:
            return "snow"
        case .sleet:
            return "sleet"
        case .wind:
            return "wind"
        case .fog:
            return "fog"
        case .cloudy:
            return "cloudy"
        case .partlycloudyday:
            return "partly-cloudy-day"
        case .partlycloudynight:
            return "partly-cloudy-night"
        default:
            return ""
        }
    }
    
    static func convert(byString val:String) -> WAPrecipType {
        switch val {
        case "snow":
            return .snow
        case "rain":
            return .rain
        case "sleet":
            return .sleet
        default:
            return .none
        }
    }
    static func reverse(byIcon ic:WAPrecipType) -> String {
        switch ic {
        case .snow:
            return "snow"
        case .rain:
            return "rain"
        case .sleet:
            return "sleet"
        default:
            return ""
        }
    }
    
}
