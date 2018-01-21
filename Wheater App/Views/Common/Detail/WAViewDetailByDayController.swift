//
//  WAViewDetailByDayController.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 21/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit

class WAViewDetailByDayController : UIViewController {
    static let storyboardIdentifier : String = "WAViewDetailByDayControllerStoryboardIdentifier"
    
    var datas : WAWheaterDataDayGlobal?
    
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
extension WAViewDetailByDayController : UITableViewDataSource {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: WADayCell.reusableIdentifier, for: indexPath) as! WADayCell
        if let d = self.datas {
            let item = d.data[indexPath.row]
            cell.setItem(data: item)
        }
        return cell
    }
}
