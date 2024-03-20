//
//  AddPromocod - Presenter.swift
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
            self.viewController.navigationItem.rightBarButtonItem?.isEnabled = false
            return
        }
        
        let parametrBool = (text != "")
        let addBtnTitle = parametrBool ? "Qo'shish" : "Maydonni to'ldiring"

        self.view.addBtn.setTitle(addBtnTitle, for: .normal)
        self.viewController.navigationItem.rightBarButtonItem?.isEnabled = parametrBool ? true : false
        self.view.addBtn.backgroundColor = parametrBool ? .systemYellow : .systemGray6
        self.viewController.enteredPromocod = parametrBool ? true : false
    }
}


