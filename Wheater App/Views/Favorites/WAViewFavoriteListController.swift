//
//  WAViewFavoriteListController.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit

class WAViewFavoriteListController : UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    
    var items = Array<WALocationAndWheater>()
    
    override func viewDidLoad() {
        self.tableview.register(WAFavoriteCell.self, forCellReuseIdentifier: WAFavoriteCell.reusableIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reload()
    }
    
    func reload() {
        if let list = WACaheManager.sharedInstance.get() {
            self.items = list
            self.tableview.reloadData()
        }
        
    }
    
    @IBAction func edit(sender:Any?) {
        
    }
}

extension WAViewFavoriteListController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: WAFavoriteCell.reusableIdentifier, for: indexPath)
        let item = self.items[indexPath.row]
        if let location = item.location {
            cell.textLabel?.text = String(format:"%@, %@", location.name, location.countryName)
        }
        
        return cell
    }
}
