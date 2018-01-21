//
//  WADayCell.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 21/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit

class WADayCell : UITableViewCell {
    static let reusableIdentifier : String = "WADayCellreusableIdentifier"
    static let cellHeight : CGFloat = 120
    
    var datas : WAWheaterDataByDay?
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var temperaturesLabel: UILabel!
    
    
    func setItem(data:WAWheaterDataByDay) {
        self.datas = data
        self.updateView()
        
    }
    
    private func updateView() {
        if let d = self.datas {
            self.dateLabel.text = d.time?.toCalendarString()
            self.iconImage.image = WAEnumConverter.toImage(byIcon: d.icon)
            self.temperaturesLabel.text = String(format:"Min : %lu° / Max : %lu°", Int(d.temperatureLow), Int(d.temperatureHigh))
        }
    }
}


