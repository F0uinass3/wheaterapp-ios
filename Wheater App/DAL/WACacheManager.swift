//
//  WACacheManager.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import SwiftyJSON

class WACaheManager : NSObject {
    //MARK: Singleton declaration
    static let sharedInstance : WACaheManager = WACaheManager()
    
    
    //MARK: private consts
    private let defaults : UserDefaults = UserDefaults.standard
    
    private let kCacheKeyCachedFavoritePlaces : String = "kCacheKeyCachedFavoritePlaces"
    private let kCacheKeyCachedFavoritePlaceUpdateOn : String = "kCacheKeyCachedFavoritePlaceUpdateOn"
    
    private let kKeyFavorites : String = "favorites"
    
    private let kCacheKeyCachedMyLocation : String = "kCacheKeyCachedMyLocation"
    private let kCacheKeyCachedMyLocationUpdatedOn : String = "kCacheKeyCachedMyLocationUpdatedOn"
    
    private var favorites : Array<WALocationAndWheater> = Array<WALocationAndWheater>()
    private var myPlace : WALocationAndWheater? = nil
    
    
    //MARK: Init
    override init() {
        super.init()
    }
    
    //MARK: handle favorite places cache
    func store(datas:WALocationAndWheater) {
        let l = self.favorites.filter { $0.location?.geonameId == datas.location?.geonameId }
        if l.count == 0 {
            self.favorites.append(datas)
        }
        
        self.defaults.set(self.favorites.map({ $0.toJSON() }) , forKey: kCacheKeyCachedFavoritePlaces)
        self.defaults.synchronize()
        
    }
    func remove(byId id: Int64) {
        let l = self.favorites.filter { $0.location?.geonameId != id }
        self.defaults.set(l.map({ $0.toJSON() }), forKey: kCacheKeyCachedFavoritePlaces)
        self.defaults.synchronize()
    }
    
    
    
    func get() -> Array<WALocationAndWheater>? {
        if let datas = self.defaults.value(forKey: kCacheKeyCachedFavoritePlaces) {
            if let json = try? JSON(datas) {
                if let items = json.array {
                    for item in items {
                        self.favorites.append(WALocationAndWheater(json: item.dictionary))
                    }
                }
            }
        }
//        if let string = self.defaults.value(forKey: kCacheKeyCachedFavoritePlaces) as? String {
//            self.favorites = Array<WALocationAndWheater>()
////            let dataString = string.data(using: .utf8, allowLossyConversion: false)
//            if let list = try? JSON(data:dataString!) {
//                if let items = list.array  {
////                    self.favorites = items
//                    for item in items {
//                        self.favorites.append(WALocationAndWheater(fromJSON: item))
//                    }
//                }
//            }
//
//        }
        return self.favorites
    }
    
    
    //MARK: handle my location cache
    func storeMyLocation(datas:WALocationAndWheater) {
        
    }
    
    func getMyLocation() -> WALocationAndWheater? {
        return self.myPlace
    }
}
