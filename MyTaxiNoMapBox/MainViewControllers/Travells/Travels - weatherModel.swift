//
//  Travels - weatherModel.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit

struct WeatherDatas: Codable {
    
    let list: [WeatherData]
}

struct WeatherData: Codable {
    
    let weather: [Weather]
    let main: Main
    let dt_txt: String
}

struct Main: Codable {
    
    let temp: Double
}

struct Weather: Codable {
    
    let id: Int
}


