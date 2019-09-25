//
//  URL+Extensions.swift
//  GoodWeather
//
//  Created by 桑江 望 on 2019/09/25.
//  Copyright © 2019 Nozomu Kuwae. All rights reserved.
//

import Foundation

extension URL {
    
    static func urlForWeatherAPI(city: String) -> URL? {
        let filePath = Bundle.main.path(forResource: "Private", ofType: "plist")
        let plist = NSDictionary(contentsOfFile: filePath!)
        guard let appID = plist?["AppID"] as? String else { fatalError() }
        
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=" + city + "&units=metric&appid=" + appID)
    }
}
