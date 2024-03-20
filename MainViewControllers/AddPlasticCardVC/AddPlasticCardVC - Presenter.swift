//
//  AddPlasticCardVC - Presenter.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 14/02/24.
//

import UIKit

protocol AddPlasticCardVCPresentable: AnyObject {
    
    var view: AddPlasticCardVCHomeView! { get set }
    var viewController: AddPlasticCardVC! { get set }
    
    func cardValidator(text: String, validType: CardProperties) -> String

    func textFieldDidChangeSelection(_ textField: UITextField)
    
    func readyCardInformation() -> Bool
    
    func addCardTapped()
    
}

final class AddPlasticCardVCPresenter: AddPlasticCardVCPresentable {
    
    var view: AddPlasticCardVCHomeView!
    var viewController: AddPlasticCardVC!
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if textField.tag == 0, let currentText = textField.text {

            let finalText = cardValidator(text: currentText, validType: .plasticCardNum)
            view.cardNumberTextField.text = finalText
            
            if finalText.count == 19 {
                view.lifeTimeTextField.becomeFirstResponder()
            }
        }
        
        else if textField.tag == 1, let currentText = textField.text {
            
            let finalText = cardValidator(text: currentText, validType: .plasticCardLifetime)
            view.lifeTimeTextField.text = finalText
        }
    }

    
    func cardValidator(text: String, validType: CardProperties) -> String {
        
        let numbersString = "1234567890"
        let numArr = text.filter{ numbersString.contains($0) }
        var resultArr = [Character]()
        let countArr = numArr.count
        
        for (index, item) in numArr.enumerated() {
            
            resultArr.append(item)
            
            switch validType {
                
            case .plasticCardNum:
                if (countArr - 1 > index) && (index == 3 || index == 7 || index == 11) {
                    resultArr.append(" ")
                }
            case .plasticCardLifetime:
                if index == 1 && countArr - 1 > index {
                    resultArr.append("/")
                }
            }
        }
        return String(resultArr)
    }
    
    func readyCardInformation() -> Bool {
        
        guard let cardNumText = view.cardNumberTextField.text,
                let lifeTimeText = view.lifeTimeTextField.text else { return false }
        
        let returnAnswer = (cardNumText.count == 19 && lifeTimeText.count == 5)
        
        let addCardText = returnAnswer ? "Qo'shish" : "Hamma maydonlarni to'ldiring"
        let backColor: UIColor = returnAnswer ? .systemYellow : .systemGray6
        
        view.addCardButton.setTitle(addCardText, for: .normal)
        view.addCardButton.backgroundColor = backColor
        
        return returnAnswer
    }
    
    func addCardTapped() {
        
        if let cardNum = view.cardNumberTextField.text {
            PaymentTypeLocalDataManager.shared.savePlasticCard(cardNum: cardNum)
        }
    }
}
