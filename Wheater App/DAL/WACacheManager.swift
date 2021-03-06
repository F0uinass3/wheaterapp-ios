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
    private var favorites : Array<WALocationAndWheater> = Array<WALocationAndWheater>()
    
    
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
        
        self.defaults.set(NSKeyedArchiver.archivedData(withRootObject: self.favorites as NSArray) as NSData, forKey: kCacheKeyCachedFavoritePlaces)
        self.defaults.synchronize()
        
    }
    func update(location:WALocation, datas:WALocationWheater) {
        let l = self.favorites.filter { $0.location?.geonameId == location.geonameId }
        if l.count == 1 {
            let item = l.first!
            item.wheater = datas
        }
        self.defaults.set(NSKeyedArchiver.archivedData(withRootObject: self.favorites as NSArray) as NSData, forKey: kCacheKeyCachedFavoritePlaces)
        self.defaults.synchronize()
    }
    
    func remove(byId id: Int64) {
        let l = self.favorites.filter { $0.location?.geonameId != id }
        self.defaults.set(NSKeyedArchiver.archivedData(withRootObject:l as NSArray) as NSData, forKey: kCacheKeyCachedFavoritePlaces)
        self.defaults.synchronize()
    }
    
    func replace(wheaters:Array<WALocationAndWheater>) {
        self.favorites = wheaters
        self.defaults.set(NSKeyedArchiver.archivedData(withRootObject: self.favorites as NSArray) as NSData, forKey: kCacheKeyCachedFavoritePlaces)
        self.defaults.synchronize()
    }
    
    func get() -> Array<WALocationAndWheater>? {
        if let unarchivedObject = self.defaults.object(forKey: kCacheKeyCachedFavoritePlaces) as? Data {
            if let list = NSKeyedUnarchiver.unarchiveObject(with: unarchivedObject as Data) as? Array<WALocationAndWheater> {
                self.favorites = list
            }
        }
        
        return self.favorites
        
    }
    
    func getCredits() -> Array<WACredit> {
        var results = Array<WACredit>()
        if let path = Bundle.main.path(forResource: "credits", ofType: "json"){
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) {
                if let json = try? JSON(data) {
                    if let arr = json["credits"].array {
                        for c in arr {
                            results.append(WACredit(url: c["url"].stringValue, title: c["title"].stringValue, imageName: c["imageName"].stringValue, details: c["description"].stringValue))
                        }
                    }
                }
            }
        }
        return results
    }
}
