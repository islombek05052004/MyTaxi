//
//  EnterLocationViewController.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 11/03/24.
//

import UIKit

class EnterLocationVC: UIViewController {

    private var presenter: EnterLocationVCPresentable
    private let mainView = EnterLocationVCHomeView()
    
    init() {
        self.presenter = EnterLocationVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
