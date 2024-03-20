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
    func setAllTargets()
}

class EditPersonalDataVCPresenter: EditPersonalDataVCPresentable {
    
    var viewController: EditPersonalDataViewController!
    var view: PersonalDataVCView!

    func setAllTargets() {
        view.saveBtn.addTarget(self, action: #selector(saveDataBtnClick), for: .touchUpInside)
    }
    @objc func saveDataBtnClick() {
        
        guard var currentPersonalData = UserDefaultsManager.shared.getAccoundData() else { return }
        
        if let nameText = view.nameTF.text {
            currentPersonalData.name = nameText
        }
        
        if let surnameText = view.surnameTF.text {
            currentPersonalData.surname = surnameText
        }
        
        if let emailText = view.emailTF.text {
            currentPersonalData.email = emailText
        }
        
        if let birthdayText = view.birthdayTF.text {
            currentPersonalData.birthday = birthdayText
        }
        
        UserDefaultsManager.shared.saveAccoundDataOneTime(data: currentPersonalData)
        viewController.popVC()
    }
}
