//
//  SettingsLanguage - Presenter.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 10/02/24.
//

import UIKit

protocol SettingsLanguageVCPresentable: AnyObject {
    
    var view: SettingsLanguageVCHomeView! { get set }
    var viewController: SettingsLanguageVC! { get set }
    
    func selectedLanguage(btn: UIButton)
}

final class SettingsLanguageVCPresenter: SettingsLanguageVCPresentable {
    
    weak var view: SettingsLanguageVCHomeView!
    weak var viewController: SettingsLanguageVC!
    
    func selectedLanguage(btn: UIButton) {
        
        let languageViews = [self.view.uzbButtonView,
                             self.view.rusButtonView,
                             self.view.engButtonView]
        
        for index in 0...2  {
            languageViews[index].languageIs(selected: (btn.tag == index))
        }
    }
}


