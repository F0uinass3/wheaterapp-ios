//
//  WAViewAPICredits.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit

class WAViewAPICredits : UIViewController {
    
    var items : Array<WACredit> = Array<WACredit>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = WACaheManager.sharedInstance.getCredits()
    }
}

extension WAViewAPICredits : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WACreditCell.reusableIdentifier, for: indexPath) as! WACreditCell
        let item = self.items[indexPath.row]
        cell.setItem(credit: item)
        return cell
    }
}


extension WAViewAPICredits : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]
        let alert = UIAlertController(title: String(format:"Thanks to : ", item.title), message: item.detail, preferredStyle: .alert)
        let action = UIAlertAction(title: "Voir", style: .default) { (act) in
            if let url = URL(string: item.url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
        alert.addAction(action)
        self.show(alert, sender: nil)
    }
}
