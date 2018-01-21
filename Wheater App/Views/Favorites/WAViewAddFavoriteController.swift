//
//  WAViewAddFavoriteController.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit

class WAViewAddFavoriteController : UIViewController {
    
    let cellReusableIdentifier : String = "WAViewAddFavoriteControllercellReusableIdentifier"
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    var cities = Array<WALocation>()
    var selected : WALocation?
    
    @objc private func reload() {
        if let search = self.searchBar.text {
            WAServiceManager.sharedInstance.search(with: search) { (success, list, err) in
                if let e = err {
                    let message = String(format:NSLocalizedString("ERROR_MESSAGE_GEONAME_API_ERROR", comment: "ERROR_MESSAGE_GEONAME_API_ERROR"), e.localizedDescription)
                    self.alert(title: NSLocalizedString("ALERT_TITLE_ERROR", comment: "ALERT_TITLE_ERROR"), message: message, closeText: NSLocalizedString("ALERT_BUTTON_OK", comment: "ALERT_BUTTON_OK"), closeStyle: .cancel)
                } else {
                    if let l = list {
                        self.cities = l
                        self.tableview.reloadData()
                    }
                }
            }
        }
    }
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension WAViewAddFavoriteController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: cellReusableIdentifier, for: indexPath)
        let current = self.cities[indexPath.row]
        cell.textLabel?.text = String(format:"%@, %@", current.name, current.countryName)
        return cell
    }
}

extension WAViewAddFavoriteController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selected = self.cities[indexPath.row]
        if let selection = self.selected {
            WACaheManager.sharedInstance.store(datas: WALocationAndWheater(location: selection))
            self.dismiss(animated: true, completion: nil)
        }
        
        
    }
}

extension WAViewAddFavoriteController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.lengthOfBytes(using: .utf8) > 3 {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload), object: nil)
            self.perform(#selector(self.reload), with: nil, afterDelay: 0.5)
        }
        
    }
    
}
