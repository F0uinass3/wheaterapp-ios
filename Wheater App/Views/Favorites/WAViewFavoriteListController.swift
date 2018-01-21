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
    static let segueNavigateDetail : String = "SegueNavigateDetail"
    private let refreshControl = UIRefreshControl()
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var updateLabel: UILabel!
    
    var items = Array<WALocationAndWheater>()
    var selected : WALocationAndWheater?
    
    override func viewDidLoad() {
        
        WAServiceManager.sharedInstance.delegate = self
        self.refreshControl.addTarget(self, action: #selector(pull(sender:)), for: .valueChanged)
        
        self.tableview.refreshControl = self.refreshControl
        
        if let list = WACaheManager.sharedInstance.get() {
            self.items = list
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reload()
    }
    
    func reload() {
        if let list = WACaheManager.sharedInstance.get() {
            self.items = list
        }
        WAServiceManager.sharedInstance.fetchBulk(locations: self.items.map({ $0.location! }))
    }
    
    @IBAction func edit(sender:Any?) {
        
    }
    @objc func pull(sender:Any?) {
        self.reload()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == WAViewFavoriteListController.segueNavigateDetail {
            (segue.destination as! WAViewDetailContainer).wheater = self.selected
        }
    }
}



extension WAViewFavoriteListController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableview.dequeueReusableCell(withIdentifier: WAFavoriteCell.reusableIdentifier, for: indexPath) as! WAFavoriteCell
        let item = self.items[indexPath.row]
        cell.setItem(item: item)
        return cell
    }
}

extension WAViewFavoriteListController : WAServiceDownloadProtocol {
    func bulkCompletion(wheaters:Array<WALocationAndWheater>?) {
        DispatchQueue.main.async {
            self.refreshControl.endRefreshing()
            self.updateLabel.text = Date().toString()
            if let list = wheaters {
                WACaheManager.sharedInstance.replace(wheaters: list)
                if let list = WACaheManager.sharedInstance.get() {
                    self.items = list
                    self.tableview.reloadData()
                }
            }
        }
        
    }
}

extension WAViewFavoriteListController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selected = self.items[indexPath.row]
        self.performSegue(withIdentifier: WAViewFavoriteListController.segueNavigateDetail, sender: self)

    }
}

