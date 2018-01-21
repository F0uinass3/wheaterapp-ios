//
//  WAFavoriteCell.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit

class WAFavoriteCell : UITableViewCell {
    static let reusableIdentifier : String = "WAFavoriteCellreusableIdentifier"
    static let cellHeight : CGFloat = 120
    
    
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var summaryNowLabel: UILabel!
    @IBOutlet weak var actualTemperatureLabel: UILabel!
    
    @IBOutlet weak var summaryImage: UIImageView!
    
    
    var item : WALocationAndWheater? = nil
    
    
    func setItem(item: WALocationAndWheater) {
        self.item = item
        self.updateView()
    }
    
    
    private func updateView() {
        if let i = item, let location = i.location, let wheater = i.wheater {
            self.cityLabel.text = location.name
            self.countryLabel.text = String(format:"%@ (%@)", location.countryName, location.countryCode)
            self.summaryNowLabel.text = wheater.currently.summary
            self.actualTemperatureLabel.text = String(format:"%lu", Int(wheater.currently.apparentTemperature))
            self.summaryImage.image = WAEnumConverter.toImage(byIcon: wheater.currently.icon)
        }
    }
}
