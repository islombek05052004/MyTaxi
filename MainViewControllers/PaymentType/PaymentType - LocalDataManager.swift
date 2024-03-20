//
//  PaymentType - LocalDataManager.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 28/02/24.
//

import UIKit

final class PaymentTypeLocalDataManager {
    
    static let shared = PaymentTypeLocalDataManager()
    private init () {}
    
    private var plasticCards: [PaymentTypeTableCellModel] = []
    
    private lazy var tableData = [
        
        [
            PaymentTypeTableCellModel(title: "Naqt pul",
                                      leftImage: "money",
                                      rightImage: "checklist",
                                      subTitle: nil,
                                      type: .payment,
                                      selectedPayment: true),
            
            PaymentTypeTableCellModel(title: "MyTaxi ilovasinidan biznesingiz uchun foydalaning",
                                      leftImage: "suitcase",
                                      rightImage: "right",
                                      subTitle: "Korporativ hisob ochish",
                                      type: .business,
                                      selectedPayment: false),
                    
            PaymentTypeTableCellModel(title: "Karta qo'shish",
                                      leftImage: "add",
                                      rightImage: nil,
                                      subTitle: nil,
                                      type: .addPlasticCard,
                                      selectedPayment: false)
        ],
        
        [
            PaymentTypeTableCellModel(title: "Bonusni faollashtirish",
                                      leftImage: "dollar-coin",
                                      rightImage: "right",
                                      subTitle: "Har bir safardan 1% dan cashbackga ega bo'ling",
                                      type: .cashback,
                                      selectedPayment: false)
        ],
        
        []
    ]
    
    func fetchData() -> [[PaymentTypeTableCellModel]] {
        
        return tableData
        
    }
    
    func savePlasticCard(cardNum: String) {
        
        guard var plasticCards = tableData.last else { return }
        
        let card = PaymentTypeTableCellModel(
            title: cardNum,
            leftImage: "credit-card",
            rightImage: nil,
            subTitle: nil,
            type: .payment,
            selectedPayment: false
        )
        
        plasticCards.append(card)
        
        tableData.append(plasticCards)
    }
}

