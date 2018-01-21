//
//  Date+Extensions.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 21/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MMM/yyyy HH:mm"
        return dateFormatter.string(from: self)
    }
}
