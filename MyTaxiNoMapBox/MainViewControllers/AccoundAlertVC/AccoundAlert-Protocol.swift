//
//  AccoundAlert-Protocol.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 30/01/24.
//

import UIKit

protocol AccoundAlertProtocol {
    
    func editPhoneNumber()
    func editPersonalData()
    
}

extension AccoundAlertViewController: AccoundAlertProtocol {
    
    func editPhoneNumber() {
        self.dismiss(animated: true)
        AccoundVC.pushVC(with: SendMessageViewController())
    }
    
    func editPersonalData() {
        self.dismiss(animated: true)
        AccoundVC.pushVC(with: EditPersonalDataViewController())
    }
}
