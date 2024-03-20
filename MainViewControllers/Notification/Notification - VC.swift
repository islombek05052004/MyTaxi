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
        setNavigationItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.mainView.stackView.isHidden = true
        }
    }
    
    @objc func readNavigationButtonTapped() {
        print("read all new")
    }
}

extension NotificationViewController {
    
    private func setNavigationItems() {
        
        setUpBackButton()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "readIcon")?.withTintColor(.systemGray),
            style: .done,
            target: self,
            action: #selector(readNavigationButtonTapped)
        )
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
}



