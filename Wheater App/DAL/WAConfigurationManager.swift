//
//  WAConfigurationManager.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation

class WAConfigurationManager : NSObject {
    static let sharedInstance : WAConfigurationManager = WAConfigurationManager()
    
    
    let kConfigurationKeyDarkSkyApiKey = "kConfigurationKeyDarkSkyApiKey" // 16178161b8aad3e84ceba8441e3e15eb
    let kConfigurationKeyDarkSkyURL = "kConfigurationKeyDarkSkyURL" // https://api.darksky.net/forecast/%@/%@lat,%@long
    
    let kConfigurationKeyGeoNameApiAccount = "kConfigurationKeyGeoNameApiAccount" //f0uinasse
    let kConfigurationKeyGeoNameURL = "kConfigurationKeyGeoNameURL" // https://secure.geonames.org/searchJSON?q=london&maxRows=10&style=LONG&lang=fr&username=f0uinasse
    
    
    override init() {
        super.init()
    }
    
    
    
    
    
}
