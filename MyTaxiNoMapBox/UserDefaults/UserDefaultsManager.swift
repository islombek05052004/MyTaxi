//
//  UserDefaultsManager.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 03/02/24.
//

import UIKit

class UserDefaultsManager {
    
    static let shared = UserDefaultsManager()
    private init() {}
    
    private let key = "AccountVCData"
    private let keyImage = "AccountImageKey"
    private let plasticCard = "plasticCard"
    
    func getAccoundData() -> AccountVCData? {

        if let data = UserDefaults.standard.object(forKey: key) as? Data {
            if let accountData = try? JSONDecoder().decode(AccountVCData.self, from: data) {
                return accountData
            }
        }
        return nil
    }
    
    func saveAccoundDataOneTime(data: AccountVCData) {
        UserDefaults.standard.removeObject(forKey: key)
        
        if let jsonData = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(jsonData, forKey: key)
        }
    }
    
    func saveAccountImage(image: UIImage?) {
         
        if let image = image, let jsonData = image.pngData() {
            UserDefaults.standard.set(jsonData, forKey: keyImage)
        }
    }
    
    func getAccountImageData() -> UIImage? {
        
        if let data = UserDefaults.standard.object(forKey: keyImage) as? Data, let image = UIImage(data: data) {
            return image
        }
        return UIImage(named: "userAccoundImage")?.withTintColor(.systemGray3)
    }
    
    func deleteAccountData() {
        
        UserDefaults.standard.removeObject(forKey: keyImage)
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    func deleteAccountImage() {
        
        UserDefaults.standard.removeObject(forKey: keyImage)
    }
}


