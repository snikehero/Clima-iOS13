//
//  WeatherManager.swift
//  Clima
//
//  Created by Moises Sanchez on 25/03/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?"
    let apiKey = "055718f2c18c8aa537980c6917ec7724"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)q=\(cityName)&appid=\(apiKey)"
        print(urlString)
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. Create a url
        if let url = URL(string: urlString) {
            //2. Create a urlSession
            let session = URLSession(configuration: .default)
            //3. Give the session a Task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            
        }
        func handle(data: Data?, response: URLResponse?, error: Error?) {
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data {
                let dataString = String(data: safeData, encoding: .utf8)
                print(dataString ?? "default")
            }
        }
        
    }
    
}
