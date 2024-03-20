//
//  HelpViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class HelpViewController: UIViewController {

    private let mainView = HelpVCHomeView()
    private var presenter: HelpVCPresentable
    
    init() {
        self.presenter = HelpVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        title = "Yordam"
        setUpBackButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setTargetFunctions()
    }
    
    private func setTargetFunctions() {
        
        self.mainView.supportBtn.addTarget(self,
                                           action: #selector(supportButtonTapped),
                                           for: .touchUpInside)
        
        self.mainView.addLocationBtn.addTarget(self,
                                               action: #selector(addLocationBtnTapped),
                                               for: .touchUpInside)
        
        self.mainView.tariffBtn.addTarget(self,
                                          action: #selector(tariffBtnTapped),
                                          for: .touchUpInside)
        
        self.mainView.callBtn.addTarget(self,
                                        action: #selector(callBtnTapped),
                                        for: .touchUpInside)
        
        self.mainView.errorBtn.addTarget(self,
                                         action: #selector(errorBtnTapped),
                                         for: .touchUpInside)

    }
    
    @objc func supportButtonTapped() { self.presenter.supportButtonTapped() }
    @objc func addLocationBtnTapped() { self.presenter.addLocationBtnTapped() }
    @objc func tariffBtnTapped() { self.presenter.tariffBtnTapped() }
    @objc func callBtnTapped() { self.presenter.callBtnTapped() }
    @objc func errorBtnTapped() { self.presenter.errorBtnTapped() }

}
