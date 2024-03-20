//
//  HelpVC - Presenter.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 11/02/24.
//

import UIKit

protocol HelpVCPresentable: AnyObject {
    var view: HelpVCHomeView! { get set }
    var viewController: HelpViewController! { get set }
    
    func supportButtonTapped()
    func tariffBtnTapped()
    func addLocationBtnTapped()
    func callBtnTapped()
    func errorBtnTapped()
}

final class HelpVCPresenter: HelpVCPresentable {
    weak var view: HelpVCHomeView!
    weak var viewController: HelpViewController!
    
    func supportButtonTapped() { self.viewController.pushVC(with: CustomerServiceVC()) }
    
    func addLocationBtnTapped() {
        let addNewLocationVC = AddNewLocationVC()
        addNewLocationVC.modalPresentationStyle = .pageSheet
        
        if #available(iOS 15, *), let sheet = addNewLocationVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.viewController.present(with: addNewLocationVC)
    }
    
    func tariffBtnTapped() { self.viewController.pushVC(with: TariffViewController()) }

    func callBtnTapped() {
        
        guard let accountData = UserDefaultsManager.shared.getAccoundData() else { return }
        
        let alertVC = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let currentNumberAction = UIAlertAction(title: accountData.number, style: .default)
        let cancelAction = UIAlertAction(title: "Bekor qilish", style: .cancel)
        
        alertVC.addAction(currentNumberAction)
        alertVC.addAction(cancelAction)
        
        self.viewController.present(with: alertVC)
    }
    
    func errorBtnTapped() {
        
        let alertVC = UIAlertController(title: "Xatolik haqida xabar berildi", message: nil, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        
        alertVC.addAction(okAction)
        self.viewController.present(with: alertVC)
    }

}
