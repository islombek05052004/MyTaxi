//
//  PromocodViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class PromocodViewController: UIViewController {
    
    private var presenter: PromocodVCPresenter
    private let mainView = PromocodVCView()
    
    init() {
        self.presenter = PromocodVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        self.title = "Promokodlar"
        setUpBackButton()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTargets()
    }
    
    private func setTargets() {
        self.mainView.addPromocodBtn.addTarget(self, action: #selector(addBtnTapped), for: .touchUpInside)
    }
    
    @objc func addBtnTapped() {
        self.presenter.addPromocodBtnClick()
    }
}
