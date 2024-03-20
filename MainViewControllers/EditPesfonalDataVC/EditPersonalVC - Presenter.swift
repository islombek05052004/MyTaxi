//
//  EditPersonalVC - Presenter.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 05/02/24.
//

import UIKit

protocol EditPersonalDataVCPresentable: AnyObject {
    
    var viewController: EditPersonalDataViewController! { get set }
    var view: PersonalDataVCView! { get set }
    
    func saveDataBtnClick()
    func tappedCalendarBtn()
}

class EditPersonalDataVCPresenter: EditPersonalDataVCPresentable {
    
    var viewController: EditPersonalDataViewController!
    var view: PersonalDataVCView!

    func saveDataBtnClick() {
        
        guard var currentPersonalData = UserDefaultsManager.shared.getAccoundData() else { return }
        
        if let nameText = view.nameTF.text {
            currentPersonalData.name = nameText
        }
        
        if let surnameText = view.surnameTF.text {
            currentPersonalData.surname = surnameText
        }
        
        if let birthdayText = view.birthdayTF.text {
            currentPersonalData.birthday = birthdayText
        }
        
        UserDefaultsManager.shared.saveAccoundDataOneTime(data: currentPersonalData)
        viewController.popVC()
    }
    
    func tappedCalendarBtn() {
        let calendarVC = CalendarViewController()
        calendarVC.modalPresentationStyle = .pageSheet
        calendarVC.delegate = self.viewController
        if #available(iOS 15, *), let sheet = calendarVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.viewController.present(with: calendarVC)
    }
}
