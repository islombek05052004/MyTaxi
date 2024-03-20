//
//  SelectedPermanentViewController.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 12/02/24.
//

import UIKit

final class SelectedPermanentAddressViewController: UIViewController {

    private var presenter: SelectedPermanentAddressVCPresentable
    private let mainView = SelectedPermanentAddressVCHomeView()
    
    init() {
        self.presenter = SelectedPermanentAddressVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTargetFunctions()
    }
    
    private func setTargetFunctions() {
        
        self.mainView.backButton.addTarget(self,
                                           action: #selector(backButtonTapped),
                                           for: .touchUpInside)
    }
    
    @objc func backButtonTapped() { dismiss(animated: true) }
}
