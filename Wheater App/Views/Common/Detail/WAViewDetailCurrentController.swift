//
//  WAViewDetailCurrentController.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit

class WAViewDetailCurrentController : UIViewController {
    static let storyboardIdentifier : String = "WAViewDetailCurrentControllerStoryboardIdentifier"
    
    var datas : WAWheaterDataGeneric?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
