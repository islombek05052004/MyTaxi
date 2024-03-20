//
//  SettingsViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class SettingsViewController: UIViewController {

    private let mainView = SettingsVCHomeView()
    private var presenter: SettingsVCPresentable
    
    init() {
        self.presenter = SettingsVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        title = "Sozlamalar"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackButton()
        
        

        
        setTargetFunctions()
    }
    
    private func setTargetFunctions() {
        
        self.mainView.contractButton.selector = #selector(contractButtonTapped)
        self.mainView.languageButton.selector = #selector(languageButtonTapped)
        
        self.mainView.contractButton.addTarget(self, action: #selector(contractButtonTapped), for: .touchUpInside)
        self.mainView.languageButton.addTarget(self, action: #selector(languageButtonTapped), for: .touchUpInside)
    }
    
    @objc func languageButtonTapped() {
        
        self.presenter.languageButtonTapped()
    }
    
    @objc func contractButtonTapped() {
        
        self.presenter.contractButtonTapped()
    }
 
}
