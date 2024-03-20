//
//  Tariff - LocalData.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 20/02/24.
//

import UIKit


final class TariffLocalDataManager {
    
    static let shared = TariffLocalDataManager()
    
    private init() {}
    
    private let tariffArr = [
    
        TariffInformation(imageName: "ekonom", price: "Ekonom  5000 so'mdan", minPrice: "5000 so'm", priceKm: "1850 so'm", priceTime: "200 so'm", paidWaiting: "550 so'm", freeWaiting: "3 min", priceKmForCity: "2600 so'm/km", cars: "Spark, Nexia, Cobalt, Ravon R3"),
        
        TariffInformation(imageName: "komfort", price: "Komfort  7000 so'mdan", minPrice: "7000 so'm", priceKm: "2100 so'm", priceTime: "250 so'm", paidWaiting: "750 so'm", freeWaiting: "3 min", priceKmForCity: "2950 so'm/km", cars: "Cobalt, Lacetti, Gentra, Ravon R3"),
        
        TariffInformation(imageName: "premium", price: "Premium  9000 so'mdan", minPrice: "9000 so'm", priceKm: "2450 so'm", priceTime: "350 so'm", paidWaiting: "950 so'm", freeWaiting: "3 min", priceKmForCity: "3250 so'm/km", cars: "Malibe, Gentra, Captiva, Tracker"),
        
        TariffInformation(imageName: "dacha", price: "Dacha  150000 so'mdan", minPrice: "150000 so'm", priceKm: "4450 so'm", priceTime: "750 so'm", paidWaiting: "1950 so'm", freeWaiting: "3 min", priceKmForCity: "4250 so'm/km", cars: "Captiva, Tracker"),
    
        TariffInformation(imageName: "kichikKattaKuzuvli", price: "Kichik kuzuvli  60000 so'mdan", minPrice: "60000 so'm", priceKm: "4750 so'm", priceTime: "1050 so'm", paidWaiting: "0 so'm", freeWaiting: "3 min", priceKmForCity: "4750 so'm/km", cars: "Man, Truck"),

        TariffInformation(imageName: "kattaKuzuvli", price: "Katta kuzuvli  90000 so'mdan", minPrice: "90000 so'm", priceKm: "9250 so'm", priceTime: "2050 so'm", paidWaiting: "0 so'm", freeWaiting: "3 min", priceKmForCity: "9250 so'm/km", cars: "Man, Truck"),

    ]
    
    func getTariffInformation(tariffType: Int, completion: @escaping(TariffInformation) -> ()) {

        completion(tariffArr[tariffType])
    }
}
