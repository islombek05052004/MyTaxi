//
//  EditPersonalDataViewController.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 29/01/24.
//

import UIKit

class EditPersonalDataViewController: UIViewController {

    private let mainView = PersonalDataVCView()
    private var presenter: EditPersonalDataVCPresentable

    init() {
        self.presenter = EditPersonalDataVCPresenter()
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
        
        setUpBackButton()
        view.backgroundColor = .white
        title = "Shaxsiy sahifa"
        
        self.presenter.setAllTargets()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
