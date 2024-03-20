//
//  Settings - Presenter.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 10/02/24.
//

import UIKit


protocol SettingsVCPresentable : AnyObject {
    var viewController: SettingsViewController! { get set }
    var view: SettingsVCHomeView! { get set }
    
    
    func languageButtonTapped()
    func contractButtonTapped()
    
    
}

final class SettingsVCPresenter: SettingsVCPresentable {
    
    weak var viewController: SettingsViewController!
    weak var view: SettingsVCHomeView!
    
    func languageButtonTapped() {
        self.viewController.pushVC(with: SettingsLanguageVC())
    }
    
    func contractButtonTapped() {
        self.viewController.present(with: SettingsContractViewController())
    }
}
