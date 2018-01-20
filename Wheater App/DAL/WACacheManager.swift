//
//  WACacheManager.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation


class WACaheManager : NSObject {
    static let sharedInstance : WACaheManager = WACaheManager()
    
    
    
    let kCacheKeyCachedFavoritePlaces : String = "kCacheKeyCachedFavoritePlaces"
    let kCacheKeyCachedMyLocation : String = "kCacheKeyCachedMyLocation"
    
    override init() {
        super.init()
    }
}
