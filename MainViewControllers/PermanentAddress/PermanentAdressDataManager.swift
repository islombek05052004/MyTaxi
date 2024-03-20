//
//  PermanentAdressDataManager.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 12/02/24.
//

import UIKit

final class PermanentAdressDataManager {
    
    static let shared = PermanentAdressDataManager()
    private init() {}
    
    private var dataArr = [
        PermanentAdressDataModel(imageName: "house.fill", 
                                 title: "Uy",
                                 subtitle: nil,
                                 backColorImage: .orange,
                                 backColor: .systemYellow.withAlphaComponent(0.2)),
        PermanentAdressDataModel(imageName: "briefcase.fill",
                                 title: "Ish",
                                 subtitle: nil,
                                 backColorImage: .systemBlue,
                                 backColor: .systemBlue.withAlphaComponent(0.2)),
        PermanentAdressDataModel(imageName: "plus.circle.fill",
                                 title: "Yangi manzil",
                                 subtitle: nil,
                                 backColorImage: .systemBlue,
                                 titleColor: .systemBlue)
    
    ]
    
    func getData() -> [PermanentAdressDataModel] {
        
        return dataArr
    }
    
    func saveData(with data: PermanentAdressDataModel) {
        
        dataArr.insert(data, at: dataArr.count - 1)
    }
    
    func removeData(with dataIndex: Int) {
        
        dataArr.remove(at: dataIndex)
    }
}
