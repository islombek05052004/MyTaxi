//
//  Home - Presenter.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 04/02/24.
//

import UIKit

protocol HomeViewPresenterable: AnyObject {
    
    var viewController: HomeViewController! { get set }
    var view: HomeView! { get set }
    
    func selectedLanguageBtnTapped(btn: UIButton)
    func setUpAllTargets()
    func nextBtnTapped()
}

final class HomeViewPresenter: HomeViewPresenterable {
    
    weak var view: HomeView!
    weak var viewController: HomeViewController!

    func setUpAllTargets() {
        view.englishBtn.addTarget(self, action: #selector(selectedLanguageBtnTapped), for: .touchUpInside)
        view.russianBtn.addTarget(self, action: #selector(selectedLanguageBtnTapped), for: .touchUpInside)
        view.uzbekBtn.addTarget(self, action: #selector(selectedLanguageBtnTapped), for: .touchUpInside)
        view.nextBtn.addTarget(self, action: #selector(nextBtnTapped), for: .touchUpInside)
    }
    
    @objc func selectedLanguageBtnTapped(btn: UIButton) {
        
        let buttonViews = [view.uzbButtonView, view.russianButtonView, view.englishButtonView]
        let tag = btn.tag
        
        view.selected = true
        
        DispatchQueue.main.async { [weak self] in
            guard self != nil else { return }
            for index in 0..<buttonViews.count {
                if tag == index {
                    buttonViews[index].layer.borderColor = UIColor.systemBlue.cgColor
                    buttonViews[index].layer.borderWidth = 2
                } else {
                    buttonViews[index].layer.borderColor = UIColor.clear.cgColor
                }
            }
        }
    }
    
    @objc func nextBtnTapped() {
        
        if view.selected == false {
            viewController.alertVC(title: "Siz biror tilni tanlamadingiz",
                                   message: "Iltimos, biror bir tilni tanlang",
                                   preferredStyle: .alert)
            return
        }
        
        let sendVC = SendMessageViewController()
        viewController.pushVC(with: sendVC)
    }
}
