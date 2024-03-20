//
//  Travels - ApiManager.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit


class ApiManager {
    
    static let shared = ApiManager()
    
    private func ApiCalledWith(_ urlString: String, _ completion: @escaping(Data?) -> ()) {
        
        guard let url = URL(string: urlString) else { completion(nil); return }
        
       URLSession.shared.dataTask(with: url) { data, responce, error in
            if error == nil {
                if let data = data {
                    completion(data)
                    return
                }
            }
            if data == nil {
                if error != nil {
                    completion(nil)
                    return
                }
            }
        }.resume()
    }
    
    func weatherApiManager(_ urlString: String,_ completion: @escaping([WeatherData]?, Error?) -> ()) {

        ApiCalledWith(urlString) { data in
            if let data = data {
                do {
                    let arrWeathers = try JSONDecoder().decode(WeatherDatas.self, from: data)
                    completion(arrWeathers.list, nil)
                } catch  {
                    completion(nil, error)
                }
            }
        }
    }
}

