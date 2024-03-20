//
//  CalendarViewController.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 22/02/24.
//

import UIKit

protocol CalendarDelegate {
    func updateBirthdayData(date: String)
}

class CalendarViewController: UIViewController {

    private let mainView = CalendarVCHomeView()
    private let presenter: CalendarVCPresentable
    
    var delegate: CalendarDelegate?
    
    init() {
        self.presenter = CalendarVCPresenter()
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
        
        mainView.dataPicker.addTarget(self,
                                      action: #selector(dateSelected(picker: )),
                                      for: .valueChanged)
        
        mainView.saveBtn.addTarget(self,
                                   action: #selector(saveBtnTapped),
                                   for: .touchUpInside)
    }
    
    @objc func dateSelected(picker: UIDatePicker) {
        self.presenter.dateSelected(picker: picker)
    }
    
    @objc func saveBtnTapped() { dismiss(animated: true) }
}
