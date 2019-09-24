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

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}
