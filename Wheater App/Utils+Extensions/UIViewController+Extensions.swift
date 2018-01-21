//
//  UIViewController+Extensions.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func alert(title:String, message:String, closeText:String, closeStyle:UIAlertActionStyle) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: closeText, style: closeStyle, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
