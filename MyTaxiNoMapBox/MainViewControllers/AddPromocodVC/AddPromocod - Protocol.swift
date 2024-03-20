//
//  AddPromocod - Protocol.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit
 
protocol AddPromocodVCPresentable: AnyObject {
    
    var view: AddPromocodVCHomeView! { get set }
    var viewController: AddPromocodViewController! { get set }
    
    func checkPromocod(promocod: String)
    func textFieldDidChangeSelection(_ textField: UITextField)
}

final class AddPromocodVCPresenter: AddPromocodVCPresentable {
    
    weak var view: AddPromocodVCHomeView!
    weak var viewController: AddPromocodViewController!
    
    func checkPromocod(promocod: String) {
            
        LocalDataManager.shared.checkPromocod(promocod: promocod) { haveGotPromocod in
            
            let answerCheckLabelText = haveGotPromocod ? "Promokod muvaffaqiyatli faollashtirildi" : "Ushbu promocod mavjud emas"
         
            self.view.answerCheckPromocodLabel.text = answerCheckLabelText
            self.view.answerCheckPromocodLabel.textColor = haveGotPromocod ? .systemGreen : .red
            
            UIView.animate(withDuration: 0.4) {
                self.view.answerCheckPromocodLabel.isHidden = false
            }
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        guard let text = textField.text else {
            self.viewController.navigationItem.rightBarButtonItem?.isEnabled = false; return
            
        }
        
        if text != "" {
            self.view.addBtn.setTitle("Qo'shish", for: .normal)
            self.view.addBtn.backgroundColor = .systemYellow
            self.viewController.navigationItem.rightBarButtonItem?.isEnabled = true
            self.viewController.enteredPromocod = true
        } else {
            self.view.addBtn.setTitle("Maydonni to'ldiring", for: .normal)
            self.view.addBtn.backgroundColor = .systemGray6
            self.viewController.navigationItem.rightBarButtonItem?.isEnabled = false
            self.viewController.enteredPromocod = false
        }
    }
}


