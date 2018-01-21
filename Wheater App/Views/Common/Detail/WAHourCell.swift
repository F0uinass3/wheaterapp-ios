//
//  WAHourCell.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 21/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit

class WAHourCell : UITableViewCell {
    static let reusableIdentifier : String = "WAHourCellReusableIdentifier"

    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    @IBOutlet weak var iconImage: UIImageView!
    
    var datas : WAWheaterDataGeneric?

    func setItem(data:WAWheaterDataGeneric) {
        self.datas = data
        self.updateView()
        
    }
    
    private func updateView() {
        if let d = self.datas {
            self.temperatureLabel.text = String(format:"%@%lu°, ressenti %lu°",(d.time != nil ? String(format:"%@ à : ", d.time!.toString()) : "" ), Int(d.temperature), Int(d.apparentTemperature))
            self.iconImage.image = WAEnumConverter.toImage(byIcon: d.icon)
        }
    }
}
