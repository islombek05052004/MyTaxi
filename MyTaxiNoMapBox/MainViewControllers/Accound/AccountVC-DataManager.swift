//
//  AccountVC-DataManager.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 29/01/24.
//

import UIKit
import CoreData

class AccountDataManager {
    
    static let shared = AccountDataManager()
    private init(){}
    
    private func getContext() -> NSManagedObjectContext {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func getAccountPersonalData() -> [PersonalData] {
        
        let context = getContext()
        let request: NSFetchRequest<PersonalData> = PersonalData.fetchRequest()
        var data = [PersonalData]()
        
        do {
            data = try context.fetch(request)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return data
    }
    
    func savePhoneData(phoneNumber: String) {

        let context = getContext()
        guard let entity = NSEntityDescription.entity(forEntityName: "PhoneData", in: context) else { return }
        let phoneData = PhoneData(entity: entity, insertInto: context)
        phoneData.phoneNum = phoneNumber
        do {
            try context.save()
        } catch  {
            print(error.localizedDescription)
        }
    }
}


