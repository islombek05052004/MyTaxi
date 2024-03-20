//
//  AccoundAlert-Protocol.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 30/01/24.
//

import UIKit

protocol AccoundAlertVCPresentable {
    
    var view: AccoundAlertView! { get set }
    var viewController: AccoundAlertViewController! { get set }
    
    func editPhoneNumber()
    func editPersonalData()
}

final class AccoundAlertVCPresenter: AccoundAlertVCPresentable {
    
    var view: AccoundAlertView!
    var viewController: AccoundAlertViewController!

    func editPhoneNumber() {
        viewController.dismiss(animated: true)
        viewController.AccoundVC.pushVC(with: SendMessageViewController())
    }
    
    func editPersonalData() {
        viewController.dismiss(animated: true)
        viewController.AccoundVC.pushVC(with: EditPersonalDataViewController())
    }
}
