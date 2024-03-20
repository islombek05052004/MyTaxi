//
//  AddPromocod - UI.swift
//  MyTaxi
//
//  Created by Abdurazzoqov Islombek on 07/02/24.
//

import UIKit


final class AddPromocodVCHomeView: UIView {
    
    private let addPromocodLabel = UILabel(text: "Promokodni qo'shing",
                                           textAlignment: .center,
                                           font: .systemFont(ofSize: 19, weight: .semibold))
    
    let promocodTF = UITextField(backColor: .clear,
                                placeholder: "",
                                font: .systemFont(ofSize: 40, weight: .semibold))
    
    let addBtn = UIButton(title: "Maydonni to'ldiring",
                          backColor: .systemGray6,
                          font: .systemFont(ofSize: 21, weight: .semibold))
    
    let answerCheckPromocodLabel = UILabel(text: "Ushbu promokod mavjud emas",
                                           textColor: .red,
                                           textAlignment: .center,
                                           font: .systemFont(ofSize: 17, weight: .regular))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        toFormUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension AddPromocodVCHomeView {
    
    private func toFormUIElements() {
        
        let mainStackView = UIStackView(arrangedSubviews: [addPromocodLabel, promocodTF, answerCheckPromocodLabel],
                                        axis: .vertical,
                                        spacing: 20)
        
        promocodTF.borderStyle = .none
        promocodTF.textAlignment = .center
        
        answerCheckPromocodLabel.isHidden = true
        
        addSubview(mainStackView)
        addSubview(addBtn)
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.leftAnchor(leftAnchor, 20)
        mainStackView.rightAnchor(rightAnchor, -20)
        mainStackView.topAnchor(topAnchor, 200)

        addBtn.frame = CGRect(x: 20,
                              y: Paddings.deviceBounds.height - 100,
                              width: Paddings.deviceBounds.width - 40,
                              height: 60)
    }
}
