//
//  ViewController.swift
//  WeatherApp
//
//  Created by pravith on 3/4/19.
//  Copyright © 2019 pravith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet var latitudeTxtField: UITextField!
    @IBOutlet var logitudeTxtField: UITextField!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var fetchWeatherDataButton: UIButton!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    private let viewModel = WeatherViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        activityIndicatorView.hidesWhenStopped = true
    }
    
    private func fetchWeatherData() {
        
        activityIndicatorView.isHidden = false
        
        temperatureLabel.isHidden = true
        fetchWeatherDataButton.isHidden = true
        
        // Show Activity Indicator View
        activityIndicatorView.startAnimating()
        
        API.lat = latitudeTxtField.text!
        API.long = logitudeTxtField.text!
        
        // Fetch Weather Data
        viewModel.currentTemperature { [unowned self] (temperature) in
            
        self.temperatureLabel.text = temperature
        self.temperatureLabel.isHidden = false
            
        self.fetchWeatherDataButton.isHidden = false
        self.activityIndicatorView.stopAnimating()
        }
    }
    @IBAction func fetchWeatherData(_ sender: Any) {
        
        // Fetch Weather Data
        fetchWeatherData()
    }
}



