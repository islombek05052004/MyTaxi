//
//  HomeViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 12/01/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homePresenter: HomeViewPresenterable
    private let mainView = HomeView()
    
    init() {
        self.homePresenter = HomeViewPresenter()
        super.init(nibName: nil, bundle: nil)
        self.homePresenter.view = mainView
        self.homePresenter.viewController = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.homePresenter.setUpAllTargets()
    }
}
