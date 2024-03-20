//
//  AddNewLocationVC.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 16/02/24.
//

import UIKit

class AddNewLocationVC: UIViewController {

    private var presenter: AddNewLocationVCPresentable
    private let mainView = AddNewLocationVCHomeView()
    
    init() {
        self.presenter = AddNewLocationVCPresenter()
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
    }
}
