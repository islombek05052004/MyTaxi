//
//  AccoundAlert - VC.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 30/01/24.
//

import UIKit

class AccoundAlertViewController: UIViewController {

    private let mainView = AccoundAlertView()
    var AccoundVC: AccountViewController!
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnyTargetFunc()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss(animated: true)
    }
}

extension AccoundAlertViewController {
    
    private func setAnyTargetFunc() {
        
        mainView.personalDataBtnView.btn.addTarget(self,
                                                   action: #selector(personalBtnTapped),
                                                   for: .touchUpInside)
        mainView.phoneBtnView.btn.addTarget(self,
                                            action: #selector(phoneBtnTapped),
                                            for: .touchUpInside)
    }
    
    @objc func personalBtnTapped() { editPersonalData() }
    
    @objc func phoneBtnTapped() { editPhoneNumber() }
}
