//
//  WeatherResult.swift
//  GoodWeather
//
//  Created by 桑江 望 on 2019/09/24.
//  Copyright © 2019 Nozomu Kuwae. All rights reserved.
//

import Foundation

struct WeatherResult: Decodable {
    let main: Weather
}

extension WeatherResult {
    static var empty: WeatherResult {
        return WeatherResult(main: Weather(temp: 0.0, humidity: 0.0))
    }
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
