//
//  WAViewDetailContainer.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 21/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit


class WAViewDetailContainer : UIViewController {
    static let storyboardIdentifier : String = "WAViewDetailContainerStoryboardIdentifier"
    
    var wheater : WALocationAndWheater?
    
    @IBOutlet weak var headerContainer: UIView!
    @IBOutlet weak var pageContainer: UIView!
    @IBOutlet weak var pageControl: UISegmentedControl!
    
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var imageWheater: UIImageView!
    @IBOutlet weak var sunriseTimeLabel: UILabel!
    @IBOutlet weak var sunsetTimeLabel: UILabel!
    @IBOutlet weak var temperaturesLabel: UILabel!
    
    fileprivate lazy var pages: Array<UIViewController> = {
        var controllers = Array<UIViewController>()
        if let wh = self.wheater {
            if let current = wh.wheater?.currently {
                let currentController = self.getViewController(withIdentifier: WAViewDetailCurrentController.storyboardIdentifier) as! WAViewDetailCurrentController
                currentController.datas = current
                controllers.append(currentController)
            }
            if let byday = wh.wheater?.daily {
                let bydayController = self.getViewController(withIdentifier: WAViewDetailByDayController.storyboardIdentifier) as! WAViewDetailByDayController
                bydayController.datas = byday
                controllers.append(bydayController)
            }
            if let byhour = wh.wheater?.hourly {
                let byhourController = self.getViewController(withIdentifier: WAViewDetailByHourController.storyboardIdentifier) as! WAViewDetailByHourController
                byhourController.datas = byhour
                controllers.append(byhourController)
            }   
            
        }
        return controllers
    }()
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func buildView() {
        if let current = self.wheater, let location = current.location, let wheater = current.wheater {
            self.navigationItem.title = String(format:"%@", location.name)
            
            self.summaryLabel.text = wheater.currently.summary
            let today = wheater.daily.data[0]
            self.sunsetTimeLabel.text = today.sunsetTime != nil ? today.sunsetTime!.toStringHour()  : ""
            self.sunriseTimeLabel.text = today.sunriseTime != nil ? today.sunriseTime!.toStringHour() : ""
            self.temperaturesLabel.text = String(format:"Min : %lu° / Max : %lu°", Int(today.temperatureLow),Int(today.temperatureHigh))
            self.pageControl.selectedSegmentIndex = 0
            self.pageChanged(self)
        }
    }
    
    @IBAction func pageChanged(_ sender: Any) {
        let index = pageControl.selectedSegmentIndex
        self.show(index: index)
        
    }
    private func show(index:Int) {
        for var i in 0...index {
            self.pages[i].view.isHidden = index != i
            if index == i {
                self.addChildViewController(self.pages[i])
                self.pageContainer.addSubview(self.pages[i].view)
                self.pages[i].didMove(toParentViewController: self)
            } else {
                self.pages[i].willMove(toParentViewController: nil)
                self.pages[i].view.removeFromSuperview()
                self.pages[i].removeFromParentViewController()
                
            }
        }
    }
    
}
