//
//  SettingsLanguageVC.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 10/02/24.
//

import UIKit

final class SettingsLanguageVC: UIViewController {

    private var presenter: SettingsLanguageVCPresentable
    private let mainView = SettingsLanguageVCHomeView()
    
    init() {
        self.presenter = SettingsLanguageVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        title = "Til"
        setUpBackButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTargetFunctions()
    }
    
    private func setTargetFunctions() {
        
        self.mainView.engButtonView.languageBtn.addTarget(self,
                                                          action: #selector(languageSelected),
                                                          for: .touchUpInside)
        
        self.mainView.rusButtonView.languageBtn.addTarget(self,
                                                          action: #selector(languageSelected),
                                                          for: .touchUpInside)
        
        self.mainView.uzbButtonView.languageBtn.addTarget(self,
                                                          action: #selector(languageSelected),
                                                          for: .touchUpInside)
    }
    
    @objc func languageSelected(btn: UIButton) { self.presenter.selectedLanguage(btn: btn) }
}
