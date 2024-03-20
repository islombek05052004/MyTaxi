//
//  Travels - ApiValues.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit

class ApiValues {
    
    static let apiKey = "56797753d5da99969b3f04af2ca3f5e1"
    
    static func getUrlString(_ cityName: String) -> String {
        "https://api.openweathermap.org/data/2.5/forecast?q=\(cityName)&appid=\(ApiValues.apiKey)"
    }
}
