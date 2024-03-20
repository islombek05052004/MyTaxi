//
//  SideMenuListDataManager.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class SideMenuListDataManager {
    
    static let shared = SideMenuListDataManager()
    
    private init(){}
    
    func getListData() -> [[SideMenuDataModel]] {
        
        
        guard let accoundData = UserDefaultsManager.shared.getAccoundData() else { return [] }
        
        return [
            [
                SideMenuDataModel(title: accoundData.name, rightImage: "right", subtitle: accoundData.number),
            ],
            
            [
                SideMenuDataModel(title: "Mening safarlarim", rightImage: nil, subtitle: nil),
                SideMenuDataModel(title: "Tanlangan manzillar", rightImage: nil, subtitle: nil)
            ],
            
            [
                SideMenuDataModel(title: "To'lov turi", rightImage: "money", subtitle: "Naqd pul"),
                SideMenuDataModel(title: "Promocod", rightImage: nil, subtitle: nil),
                SideMenuDataModel(title: "Biznesingiz uchun MyTaxi", rightImage: nil, subtitle: "Korporativ taksi")
            ],
            
            [
                SideMenuDataModel(title: "Xabarnoma", rightImage: nil, subtitle: nil),
                SideMenuDataModel(title: "Yordam", rightImage: nil, subtitle: nil),
                SideMenuDataModel(title: "Sozlamalar", rightImage: nil, subtitle: nil)
            ]
        ]
    }
}
