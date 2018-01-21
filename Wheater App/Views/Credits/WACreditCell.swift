//
//  WACreditCell.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 21/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit


class WACreditCell : UITableViewCell {
    
    static let reusableIdentifier : String = "WACreditCellReusableIdentifier"
    var credit : WACredit?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    
    func setItem(credit:WACredit) {
        self.credit = credit
        self.updateView()
    }
    
    private func updateView() {
        if let cred = self.credit {
            self.logoImage.image = UIImage(named:cred.imageName)
            self.logoImage.tintColor = self.titleLabel.textColor
            self.titleLabel.text = cred.title
        }
    }
}
