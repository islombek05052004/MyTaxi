//
//  AddPlasticCardVC - UI.swift
//  MyTaxiNoMapBox
//
//  Created by Abdurazzoqov Islombek on 12/02/24.
//

import UIKit

enum CardProperties: Int, CaseIterable {
    
    case plasticCardNum = 0
    case plasticCardLifetime = 1
}

class AddPlasticCardVCHomeView: UIView {
    
    private let cardNumberLabel = UILabel(text: "Karta raqami",
                                          font: .systemFont(ofSize: 17, weight: .semibold))
    
    private let lifetimeoffPlasticCard = UILabel(text: "Amal qilish muddati",
                                                 font: .systemFont(ofSize: 17, weight: .semibold))
    
    let cardNumberTextField = UITextField(backColor: .clear,
                                          placeholder: "0000 0000 0000 0000",
                                          font: .systemFont(ofSize: 19, weight: .semibold),
                                          borderStyle: .none)
    
    let lifeTimeTextField = UITextField(backColor: .clear,
                                        placeholder: "00/00",
                                        font: .systemFont(ofSize: 19, weight: .semibold),
                                        borderStyle: .none)
    
    let scannerButton = UIButton()
    
    let addCardButton = UIButton(title: "Hamma maydonlarni to'ldiring",
                                 textColor: .black,
                                 backColor: .systemGray6,
                                 font: .systemFont(ofSize: 18, weight: .semibold),
                                 textAlignment: .center)

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        toFormUIElements()
        
        
        lifeTimeTextField.tag = CardProperties.plasticCardLifetime.rawValue
        lifeTimeTextField.keyboardType = .numberPad
        
        cardNumberTextField.tag = CardProperties.plasticCardNum.rawValue
        cardNumberTextField.keyboardType = .numberPad
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddPlasticCardVCHomeView {
    
    private func toFormUIElements() {
        
        let plasticCardNumTFView = CustomTextFieldView(textField: cardNumberTextField,
                                                       leftView: nil,
                                                       rightView: scannerButton)
        
        let lifetimePlasticCardTFView = CustomTextFieldView(textField: lifeTimeTextField,
                                                            leftView: nil,
                                                            rightView: nil)
        
        let plasticCardNumberStackView = UIStackView(
            arrangedSubviews: [cardNumberLabel, plasticCardNumTFView],
            axis: .vertical,
            spacing: 8
        )
        
        let lifetimePlasticStackView = UIStackView(
            arrangedSubviews: [lifetimeoffPlasticCard, lifetimePlasticCardTFView],
            axis: .vertical,
            spacing: 8
        )
        
        scannerButton.setImage(UIImage(systemName: "creditcard"), for: .normal)
        scannerButton.backgroundColor = .systemGray5
        scannerButton.tintColor = .gray
        
        
        
        addSubview(plasticCardNumberStackView)
        addSubview(lifetimePlasticStackView)
        addSubview(addCardButton)
        
        addCardButton.translatesAutoresizingMaskIntoConstraints = false
        plasticCardNumTFView.translatesAutoresizingMaskIntoConstraints = false
        plasticCardNumTFView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lifetimePlasticCardTFView.translatesAutoresizingMaskIntoConstraints = false
        lifetimePlasticCardTFView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        lifetimePlasticCardTFView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        plasticCardNumberStackView.translatesAutoresizingMaskIntoConstraints = false
        plasticCardNumberStackView.topAnchor(self.safeAreaLayoutGuide.topAnchor, 20)
        plasticCardNumberStackView.rightAnchor(rightAnchor, -20)
        plasticCardNumberStackView.leftAnchor(leftAnchor, 20)

        lifetimePlasticStackView.translatesAutoresizingMaskIntoConstraints = false
        lifetimePlasticStackView.topAnchor(plasticCardNumberStackView.bottomAnchor, 20)
        lifetimePlasticStackView.leftAnchor(leftAnchor, 20)
        
        addCardButton.leftAnchor(leftAnchor, 10)
        addCardButton.rightAnchor(rightAnchor, -10)
        addCardButton.bottomAnchor(bottomAnchor, -40)
        addCardButton.heightAnchor(height: 60)
    }
}
