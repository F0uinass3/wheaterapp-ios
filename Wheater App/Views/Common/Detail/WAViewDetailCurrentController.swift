//
//  WAViewDetailCurrentController.swift
//  Wheater App
//
//  Created by Frédéric ASTIC on 20/01/2018.
//  Copyright © 2018 Frédéric ASTIC. All rights reserved.
//

import Foundation
import UIKit

class WAViewDetailCurrentController : UIViewController {
    static let storyboardIdentifier : String = "WAViewDetailCurrentControllerStoryboardIdentifier"
    
    var datas : WAWheaterDataGeneric?
    
    @IBOutlet weak var precipImage: UIImageView!
    @IBOutlet weak var feelingTemperatureLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var precipLabel: UILabel!
    @IBOutlet weak var precipProbLabel: UILabel!
    @IBOutlet weak var windBearingLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    @IBOutlet weak var uvIndexLabel: UILabel!
    @IBOutlet weak var humidityProbLabel: UILabel!
    
    @IBOutlet weak var pressionLabel: UILabel!
    
    
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
        if let current = self.datas {
            self.precipImage.image = WAEnumConverter.toImage(byType: current.precipType)
            self.currentTemperatureLabel.text = String(format:"%lu", Int(current.temperature))
            self.feelingTemperatureLabel.text = String(format:"%lu", Int(current.apparentTemperature))
            self.precipLabel.text = WAEnumConverter.toString(byIcon: current.precipType)
            self.precipProbLabel.text = String(format:"%lu %", Int(current.precipProbability))
            self.windBearingLabel.text = String(format:"%lu °", current.windBearing)
            self.windSpeedLabel.text = String(format:"%lu Km/H", Int(current.windSpeed))
            self.uvIndexLabel.text = String(format:"%lu",current.uvIndex)
            self.humidityProbLabel.text =  String(format:"%lu %",Int(current.humidity))
            self.pressionLabel.text =  String(format:"%lu",Int(current.pressure))
        }
    }
}
