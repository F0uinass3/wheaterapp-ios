//
//  WAServiceManager.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import CocoaLumberjack


protocol WAServiceDownloadProtocol : class {
    func bulkCompletion(wheaters:Array<WALocationAndWheater>?)
}


class WAServiceManager : NSObject {
    //MARK: Singleton declaration
    static let sharedInstance : WAServiceManager = WAServiceManager()
    
    weak var delegate : WAServiceDownloadProtocol?
    
    //MARK: Private const
    private let kDarkSkyApiKey = "16178161b8aad3e84ceba8441e3e15eb"
    private let kDarkSkyURL = "https://api.darksky.net/forecast/%@/%@" // https://api.darksky.net/forecast/%@/%@lat,%@long
    //https://www.flaticon.com/
    private let kGeoNameApiAccount = "f0uinasse"
//    private let kGeoNameURL = "https://secure.geonames.org/searchJSON" // errors occurs in Alamofire BoringSSL
    private let kGeoNameURL = "http://api.geonames.org/searchJSON"
    
    //MARK: class definition
    override init() {
        super.init()
    }
    
    //MARK: public voids
    func search(with name:String, completion:@escaping (_ success:Bool, _ results:Array<WALocation>?, _ error:Error?) -> Void) {
        let params : Parameters = [
            "maxRows":10,
            "style":"LONG",
            "lang":"fr",
            "username":kGeoNameApiAccount,
            "q":name
        ]
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        DLog(format: "WAServiceManager::search() : URL = %@ / Params = %@", args: kGeoNameURL, params)
        Alamofire.request(kGeoNameURL, method: .get, parameters: params, encoding: URLEncoding.queryString)
            .responseJSON { (resp) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                if let e = resp.error {
                    ELog(format: "WAServiceManager::search() finished with error : %@", args: e.localizedDescription)
                    completion(false, nil, e)
                } else {
                    if let d = resp.data {
                        if let json = try? JSON(data:d) {
                            if let cities = json["geonames"].array {
                                var l = Array<WALocation>()
                                for c in cities {
                                    l.append(WALocation(json: c))
                                }
                                DLog(format: "WAServiceManager::search() finished with success and datas :  %ld items", args: l.count)
                                completion(true, l, nil)
                            } else {
                                WLog(format: "WAServiceManager::search() finished with success but \"geonames\" key was null", args: nil)
                                completion(true, nil, nil)
                            }
                        } else {
                            WLog(format: "WAServiceManager::search() finished with success but json data couldn't be parsed", args: nil)
                            completion(true, nil, nil)
                        }
                    } else {
                        WLog(format: "WAServiceManager::search() finished with success but no content found", args: nil)
                        completion(true, nil, nil)
                    }
                    
                }
        }
    }
    
    func getWheater(location:WALocation, completion:@escaping (_ success:Bool, _ results:WALocationWheater?, _ error:Error?) -> Void) {
        let coords = String(format:"%f,%f", location.latitude, location.longitude)
        let stringUrl = String(format:kDarkSkyURL, kDarkSkyApiKey, coords)
        let params : Parameters = [
            "lang": "fr",
            "units" : "ca"
        ]
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        DLog(format: "WAServiceManager::getWheater() : URL = %@", args: stringUrl)
        Alamofire.request(stringUrl, method: .get, parameters: params, encoding: URLEncoding.queryString)
            .responseJSON { (resp) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                if let e = resp.error {
                    ELog(format: "WAServiceManager::getWheater() finished with error : %@", args: e.localizedDescription)
                    completion(false, nil, e)
                } else {
                    if let d = resp.data {
                        if let json = try? JSON(data:d) {
                            DLog(format: "WAServiceManager::getWheater() finished with success %@", args: json)
                            completion(true, WALocationWheater(json: json), nil)
                        } else {
                            WLog(format: "WAServiceManager::getWheater() finished with success but json couldn't be parsed", args: nil)
                            completion(true, nil, nil)
                        }
                    } else {
                        WLog(format: "WAServiceManager::getWheater() finished with success but no content found", args: nil)
                        completion(true, nil, nil)
                    }
                }
        }
    }
    
    func fetchBulk(locations:Array<WALocation>) {
        let max = locations.count
        var counter = max
        var results = Array<WALocationAndWheater>()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        for loc in locations {
            let coords = String(format:"%f,%f", loc.latitude, loc.longitude)
            let stringUrl = String(format:kDarkSkyURL, kDarkSkyApiKey, coords)
            let params : Parameters = [
                "lang": "fr",
                "units" : "ca"
            ]
            Alamofire.request(stringUrl, method: .get, parameters: params, encoding: URLEncoding.queryString)
                .responseJSON(completionHandler: { (resp) in
                    counter -= 1
                    if resp.error == nil, let d = resp.data {
                        if let json = try? JSON(data:d) {
                            results.append(WALocationAndWheater(location: loc, wheater: WALocationWheater(json: json)))
                        }
                    }
                    if counter == 0 {
                        UIApplication.shared.isNetworkActivityIndicatorVisible = false
                        self.delegate?.bulkCompletion(wheaters: results)
                    }
                })
        }
    }
}
