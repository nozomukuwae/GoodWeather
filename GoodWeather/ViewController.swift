//
//  ViewController.swift
//  GoodWeather
//
//  Created by Nozomu Kuwae on 9/24/19.
//  Copyright © 2019 Nozomu Kuwae. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityNameTextField.rx.value
            .subscribe(onNext: { city in
                if let city = city {
                    if city.isEmpty {
                        self.displayWeather(nil)
                    } else {
                        self.fetchWeather(by: city)
                    }
                }
            }).disposed(by: disposeBag)
    }
    
    private func fetchWeather(by city: String) {
        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
            let url = URL.urlForWeatherAPI(city: cityEncoded) else {
                return
        }
        
        let resource = Resource<WeatherResult>(url: url)
        
        URLRequest.load(resource: resource)
            .observeOn(MainScheduler.instance)
            .catchErrorJustReturn(WeatherResult.empty)
            .subscribe(onNext: { (weatherResult) in
                if let weatherResult = weatherResult {
                    self.displayWeather(weatherResult.main)
                }
            }).disposed(by: disposeBag)
    }

    private func displayWeather(_ weather: Weather?) {
        if let weather = weather {
            self.temperatureLabel.text = "\(weather.temp) ℃"
            self.humidityLabel.text = "\(weather.humidity) %"
        } else {
            self.temperatureLabel.text = "🙀"
            self.humidityLabel.text = "🙀"
        }
    }
}

