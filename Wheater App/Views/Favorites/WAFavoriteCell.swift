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
    var item : WALocationAndWheater? = nil
    
    
    func setItem(item: WALocationAndWheater) {
        self.item = item
        self.updateView()
    }
    
    
    private func updateView() {
    
    }
}
