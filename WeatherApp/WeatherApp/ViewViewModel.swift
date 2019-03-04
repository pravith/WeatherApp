//
//  ViewViewModel.swift
//  WeatherApp
//
//  Created by Arun PK on 3/4/19.
//  Copyright © 2019 pravith. All rights reserved.
//

import Foundation

enum API {
    
    static var  lat = ""
    static var long = ""
    static let APIKey = "846cd708c029b2a5c0be9214bf2943c7"
    static let baseURL = URL(string: "https://api.darksky.net/forecast")!
    
    static var requestURL: URL {
        return API.baseURL
            .appendingPathComponent(API.APIKey)
            .appendingPathComponent("\(lat),\(long)")
    }
}

class WeatherViewViewModel {
    
    typealias   CurrentTemperatureCompletion = (String) -> Void
    
    func currentTemperature(completion: @escaping CurrentTemperatureCompletion) {
        
        let dataTask = URLSession.shared.dataTask(with: API.requestURL) { [weak self] (data, response, error) in
            
            var formattedTemperature: String?
            
            if let data = data {
                formattedTemperature = self?.temperature(from: data)
            }
            
            DispatchQueue.main.async {
                completion(formattedTemperature ?? "Unable to Fetch Weather Data")
            }
        }
        dataTask.resume()
    }
    func temperature(from data: Data) -> String? {
        
        guard let JSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
            return nil
        }
        
        guard let currently = JSON?["currently"] as? [String : Any] else {
            return nil
        }
        
        guard let temperature = currently["temperature"] as? Double else {
            return nil
        }
        
        return String(format: "%.0f °F", temperature)
    }
}

