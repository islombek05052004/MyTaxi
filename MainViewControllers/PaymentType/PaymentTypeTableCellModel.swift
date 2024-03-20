//
//  PaymentTypeTableCellModel.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 09/02/24.
//

import UIKit

enum PaymentTypeTableCellMode {
    
    case payment
    case business
    case cashback
    case addPlasticCard
}

struct PaymentTypeTableCellModel {
    
    let title: String
    let leftImage: String
    let rightImage: String?
    let subTitle: String?
    let type: PaymentTypeTableCellMode
    let selectedPayment: Bool
}
