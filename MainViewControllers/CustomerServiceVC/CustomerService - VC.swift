//
//  CustomerServiceVC.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 14/02/24.
//

import UIKit

class CustomerServiceVC: UIViewController {

    private let mainView = CustomerServiceVCHomeView()
    private var presenter: CustomerServiceVCPresentable
    
    init() {
        self.presenter = CustomerServiceVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = mainView
        self.presenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        title = "Mijozlarga xizmat"
        setUpBackButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
