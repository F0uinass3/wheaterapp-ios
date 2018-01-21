//
//  WACredit.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 21/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation


class WACredit : NSObject {
    var url : String = ""
    var title : String = ""
    var imageName : String = ""
    var detail : String = ""
    
    init(url: String, title: String, imageName: String, details:String) {
        super.init()
        self.url = url
        self.title = title
        self.imageName = imageName
        self.detail = details
    }
}
