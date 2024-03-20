//
//  NotificationViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 27/01/24.
//

import UIKit

class NotificationViewController: UIViewController {

    private var presenter: NotificationVCPresentable
    private let mainView = NotificationHomeView()
    
    init() {
        
        self.presenter = NotificationVCPresenter()
        super.init(nibName: nil, bundle: nil)
        self.presenter.viewController = self
        self.presenter.view = mainView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
        title = "Yangiliklar"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.setNavigationButtons()
    }
    
    @objc func readNavigationButtonTapped() {
        print("read all new")
    }
}



