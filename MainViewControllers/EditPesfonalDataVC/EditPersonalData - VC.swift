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
        setUpBackButton()
        title = "Shaxsiy sahifa"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTargetFunctions()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setTargetFunctions() {
        
        self.mainView.dataBtn.addTarget( self, action: #selector(dataBtnTapped), for: .touchUpInside
        )
        
        self.mainView.saveBtn.addTarget( self, action: #selector(saveBtnClick), for: .touchUpInside
        )
    }
    
    @objc func dataBtnTapped() { self.presenter.tappedCalendarBtn() }
    
    @objc func saveBtnClick() { self.presenter.saveDataBtnClick() }
}

// MARK: Calendar delegates

extension EditPersonalDataViewController: CalendarDelegate {
    
    func updateBirthdayData(date: String) {
        self.mainView.birthdayTF.text = date
    }
}
