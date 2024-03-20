//
//  LocalDataManager.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 09/02/24.
//

import UIKit

final class LocalDataManager {
    
    static let shared = LocalDataManager()
    private init() {}
    
    private func getPromocodLists() -> [String] {
        
        [ "Islombek", "Uzum", "Olcha", "12345678", "1q2w3e4r"]
    }
    
    func checkPromocod(promocod: String, completion: @escaping (Bool) -> Void) {
        
        let promocodLists = getPromocodLists()
        let havePromocod = promocodLists.contains(promocod) ? true : false
        
        completion(havePromocod)
    }
}
