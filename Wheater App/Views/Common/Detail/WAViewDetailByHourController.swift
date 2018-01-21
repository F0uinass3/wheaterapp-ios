//
//  WAViewDetailByHourController.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 21/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit

class WAViewDetailByHourController : UIViewController {
    static let storyboardIdentifier : String = "WAViewDetailByHourControllerStoryboardIdentifier"
    
    var datas : WAWheaterDataGlobal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
extension WAViewDetailByHourController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let d = self.datas {
            return d.data.count
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WAHourCell.reusableIdentifier, for: indexPath) as! WAHourCell
        if let d = self.datas {
            let item = d.data[indexPath.row]
            cell.setItem(data: item)
        }
        return cell
    }
}

