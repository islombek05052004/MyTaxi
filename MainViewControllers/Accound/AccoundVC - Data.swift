//
//  AccoundVC - Data.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 29/01/24.
//

import UIKit


struct AccountVCData: Codable {
    
    var name: String
    var surname: String?
    var email: String?
    var birthday: String?
    var gender: String?
    var number: String
}

struct AccoundVCTitleData {
    
    let name = "Ism"
    let surname = "Familiya"
    let phoneNumber = "Telefon raqami"
    let eMail = "Elektron manzil"
    let birthday = "Tug'ilgan sana"
    let gender = "Jins"
}

